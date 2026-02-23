import 'dart:async';

import 'package:host_bridge/host_bridge.dart';

/// Helper to run the locmate CLI server via host_bridge and capture its listening URL.
/// Works in browser/patrol tests where dart:io Process is unavailable.
class LocmateCliHelper {
  final _hostBridgeUrl =
      const String.fromEnvironment('HOST_BRIDGE_URL', defaultValue: '');
  late final client = HostBridgeClient(_hostBridgeUrl);

  /// Matches http://host:port only (no trailing punctuation like period).
  static final _urlPattern = RegExp(r'http://[a-zA-Z0-9.]+:\d+');

  /// Starts the locmate server on the host via host_bridge, listens to the output
  /// stream until "Listening on" URL is seen, then closes the stream and returns
  /// [LocmateServer]. The process keeps running; use [LocmateServer.kill] to stop it.
  Future<LocmateServer> runLocmateCli(String inPath) async {
    final locmateDir =
        const String.fromEnvironment('LOCMATE_PACKAGE_PATH', defaultValue: '');
    if (_hostBridgeUrl.isEmpty || locmateDir.isEmpty) {
      throw StateError(
        'HOST_BRIDGE_URL and LOCMATE_PACKAGE_PATH must be set (via --dart-define)',
      );
    }

    final completer = Completer<LocmateServer>();
    int? pid;
    final buffer = StringBuffer();

    // Activate locmate from path, then run it via global
    await client.runCommand(
      RunCommandRequestModel(
        command: 'cd "$locmateDir" && dart pub global activate --source path .',
        workingDirectory: null,
        timeoutSeconds: 60,
      ),
    );

    // Create sandbox dir if it doesn't exist (-p: no error if exists, create parents)
    await client.runCommand(
      RunCommandRequestModel(
        command: 'mkdir -p $inPath',
        workingDirectory: null,
        timeoutSeconds: 10,
      ),
    );

    final stream = client.runAdvancedCommand(
      RunCommandRequestModel(
        command: 'dart pub global run locmate',
        workingDirectory: inPath,
        timeoutSeconds: 60,
      ),
    );

    late StreamSubscription<RunAdvancedCommandResponseModel> sub;
    sub = stream.listen(
      (event) {
        if (event is RunAdvancedCommandResponseModelData) {
          if (pid == null && event.pid > 0) pid = event.pid;
          buffer.write(event.stdout);
          final output = buffer.toString();
          if (output.contains('Listening on')) {
            final match = _urlPattern.firstMatch(output);
            if (match != null && !completer.isCompleted) {
              sub.cancel();
              final url = match.group(0)!;
              print('LocmateCliHelper: url: $url');
              completer.complete(LocmateServer(
                client: client,
                pid: pid ?? 0,
                url: match.group(0)!,
              ));
            }
          }
        } else if (event is RunAdvancedCommandResponseModelError &&
            !completer.isCompleted) {
          sub.cancel();
          completer.completeError(
            StateError(
                'Locmate failed (exit ${event.exitCode}): ${event.stderr}'),
          );
        }
      },
      onError: (e, st) {
        if (!completer.isCompleted) completer.completeError(e, st);
      },
      onDone: () {
        if (!completer.isCompleted) {
          completer.completeError(
            StateError(
              'Locmate stream ended before "Listening on" was seen. Output: ${buffer.toString()}',
            ),
          );
        }
      },
    );

    return completer.future.timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        sub.cancel();
        if (pid != null && pid! > 0) {
          client.runCommand(
            RunCommandRequestModel(command: 'kill $pid 2>/dev/null || true'),
          );
        }
        throw TimeoutException(
          'Locmate did not print listening URL within 30s',
        );
      },
    );
  }

  Future<void> deleteInPath(String inPath) async {
    await client.runCommand(
      RunCommandRequestModel(command: 'rm -rf $inPath'),
    );
  }
}

/// A running locmate server. Call [kill] to stop it.
class LocmateServer {
  LocmateServer({
    required this.client,
    required this.pid,
    required this.url,
  });

  final HostBridgeClient client;
  final int pid;
  final String url;

  Future<void> kill() async {
    if (pid > 0) {
      await client.runCommand(
        RunCommandRequestModel(command: 'kill $pid 2>/dev/null || true'),
      );
    }
  }
}

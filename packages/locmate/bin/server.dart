import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:locmate/locmate.dart';

import 'package:alfred/alfred.dart';
import 'package:locmate/src/server_logger.dart';
import 'package:tint/tint.dart';
import 'package:emojis/emojis.dart';
import 'package:alfred/src/type_handlers/websocket_type_handler.dart';

class Server {
  final Alfred _app = Alfred(logLevel: LogType.debug);
  String get url => 'http://${_app.server!.address.host}:${_app.server!.port}';

  Server();

  static Future<Directory> _findDefaultBinaryDirectory() async {
    final wwwUri = await Isolate.resolvePackageUri(
      Uri.parse('package:locmate/'),
    ).then((uri) => uri?.resolve('../web_output'));
    ServerLogger.instance.log(wwwUri.toString());
    if (wwwUri == null) throw 'Web assets not found (URI: $wwwUri).';
    return Directory.fromUri(wwwUri);
  }

  Future<void> run() async {
    final projectPath = Directory.current.path;
    final binaryDirectory = await _findDefaultBinaryDirectory();

    _app.all('*', cors(origin: '*'));

    _app.get(UrlPaths.projectPath, (req, res) async {
      _logRequest(req);
      return StringOpResponse(response: projectPath).toMap();
    });

    _app.post(UrlPaths.dirOperation, (req, res) async {
      final dirOpContext =
          DirOpContextMapper.fromMap((await req.bodyAsJsonMap));
      switch (dirOpContext) {
        case DirOpContextCreate():
          final dir = Directory(dirOpContext.path);
          dir.createSync(recursive: true);
          return VoidOpResponse().toMap();
        case DirOpContextRead():
          final dir = Directory(dirOpContext.path);
          return ListOpResponse(
                  response: dir
                      .listSync()
                      .map((e) => e.path.split('/').last)
                      .toList())
              .toMap();
      }
    });

    _app.post(UrlPaths.fileOperation, (req, res) async {
      final fileOpContext =
          FileOpContextMapper.fromMap((await req.bodyAsJsonMap));

      switch (fileOpContext) {
        case FileOpContextWrite():
          final file = File(fileOpContext.path);
          final formattedJson = JsonEncoder.withIndent("  ")
              .convert(jsonDecode(fileOpContext.content));

          file.writeAsStringSync(formattedJson);
          return VoidOpResponse().toMap();

        case FileOpContextDelete():
          final file = File(fileOpContext.path);
          file.deleteSync();
          return VoidOpResponse().toMap();

        case FileOpContextRead():
          final file = File(fileOpContext.path);
          return StringOpResponse(response: file.readAsStringSync()).toMap();
      }
    });

    _app.get('/*', (req, res) async {
      return binaryDirectory;
    });

    final users = <WebSocket>[];

    _app.get('/logs', (req, res) {
      return WebSocketSession(
        onOpen: (ws) {
          users.add(ws);
        },
        onClose: (ws) {
          users.remove(ws);
        },
        onMessage: (ws, dynamic data) async {
          for (var user in users) {
            user.send(data);
          }
        },
      );
    });

    _app.get(UrlPaths.version, (_, __) async {
      //TODO: Fetch from a version file or constant
      return StringOpResponse(response: '0.0.1').toMap();
    });

    await _listen(_app);

    ServerLogger.instance.log('${Emojis.compass} Listening on $url.');
    ServerLogger.instance.log(
        '  ${Emojis.worldMap} Serving static files from \'${binaryDirectory.path.blue()}\'.');
  }

  Future<void> _listen(Alfred app) async {
    final port = UrlPaths.port;
    try {
      await _app.listen(port, 'localhost');
      ServerLogger.instance.log('Listening on port $port.');
    } catch (e) {
      ServerLogger.instance.log(e.toString());
      await killProcessOnPort(port);
      return _listen(app);
    }
  }

  Future<void> killProcessOnPort(int port) async {
    try {
      // Find the process using the port
      var result = await Process.run('lsof', ['-i', ':$port']);

      if (result.exitCode != 0) {
        ServerLogger.instance.log('No process found running on port $port.');
        return;
      }

      // Extract the process ID (PID)
      var lines = result.stdout.toString().split('\n');
      if (lines.length > 1) {
        var columns = lines[1].split(RegExp(r'\s+'));
        if (columns.isNotEmpty) {
          var pid = columns[1];
          ServerLogger.instance.log('Killing process with PID: $pid');

          // Kill the process
          await Process.run('kill', ['-9', pid]);
          ServerLogger.instance
              .log('Process $pid on port $port has been killed.');
        }
      }
    } catch (e) {
      ServerLogger.instance.log('Error: $e');
    }
  }

  void _logRequest(HttpRequest req) {
    ServerLogger.instance.log('${req.method} ${req.uri.path}');
  }
}

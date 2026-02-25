import 'dart:io';
import 'dart:isolate';

import 'package:locmate/locmate.dart';

import 'package:alfred/alfred.dart';
import 'package:locmate/src/server_logger.dart';
import 'package:tint/tint.dart';
import 'package:emojis/emojis.dart';
// ignore: implementation_imports
import 'package:alfred/src/type_handlers/websocket_type_handler.dart';

class Server {
  final Alfred _app = Alfred(logLevel: LogType.debug);
  String get url => 'http://${_app.server!.address.host}:${_app.server!.port}';
  static Server? instance;
  Server();

  static Future<Directory> _findDefaultBinaryDirectory() async {
    final wwwUri = await Isolate.resolvePackageUri(
      Uri.parse('package:locmate/'),
    ).then((uri) => uri?.resolve('../web_output'));
    ServerLogger.instance.consoleLog(wwwUri.toString());
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
      final dirOpContext = DirOpContextMapper.fromMap(
        (await req.bodyAsJsonMap),
      );
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
                .toList(),
          ).toMap();
      }
    });

    _app.post(UrlPaths.fileOperation, (req, res) async {
      final fileOpContext = FileOpContextMapper.fromMap(
        (await req.bodyAsJsonMap),
      );

      switch (fileOpContext) {
        case FileOpContextWriteMap():
          final file = File(fileOpContext.path);
          final directoryPath = file.parent.path;
          final directory = Directory(directoryPath);
          if (!directory.existsSync()) {
            // The 'recursive: true' flag is essential here to create all intermediate directories
            directory.createSync(recursive: true);
            print('Created directory: $directoryPath');
          }

          file.writeAsStringSync(
            JsonStringMapper.mapToString(fileOpContext.content),
          );
          return VoidOpResponse().toMap();
        case FileOpContextWriteString():
          final file = File(fileOpContext.path);
          final directoryPath = file.parent.path;
          final directory = Directory(directoryPath);
          if (!directory.existsSync()) {
            // The 'recursive: true' flag is essential here to create all intermediate directories
            directory.createSync(recursive: true);
            print('Created directory: $directoryPath');
          }

          file.writeAsStringSync(fileOpContext.content);
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

    try {
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
    } catch (e, s) {
      ServerLogger.instance.log('WebSocket error: $e, $s');
    }

    await _app.listen(0, 'localhost');

    instance = this;

    ServerLogger.instance.log('${Emojis.compass} Listening on $url.');
    ServerLogger.instance.log(
      '  ${Emojis.worldMap} Serving static files from \'${binaryDirectory.path.blue()}\'.',
    );
  }

  void _logRequest(HttpRequest req) {
    ServerLogger.instance.log('${req.method} ${req.uri.path}');
  }
}

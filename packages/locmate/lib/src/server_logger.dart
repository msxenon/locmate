import 'package:locmate/src/server.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerLogger {
  static final ServerLogger instance = ServerLogger._();
  ServerLogger._();

  late final _channel = WebSocketChannel.connect(
    Uri.parse(Server.instance!.url).replace(scheme: 'ws', path: 'logs'),
  );
  void log(String message) {
    print('[SERVER] $message');
    try {
      _channel.sink.add(message);
    } catch (e, s) {
      print('[SERVER BACKUP LOG] $message');
      print('[SERVER LOGGER ERROR] $e,$s');
    }
  }

  void consoleLog(String message) {
    print('[SERVER] $message');
  }
}

import 'package:locmate/src/url_paths.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerLogger {
  static final ServerLogger instance = ServerLogger._();
  ServerLogger._();

  late final _channel = WebSocketChannel.connect(
    Uri.parse("ws://localhost:${UrlPaths.port}/logs"),
  );
  void log(String message) {
    print('[SERVER] $message');
    try {
      _channel.sink.add(message);
    } catch (e) {
      print('[SERVER LOGGER ERROR] $e');
    }
  }
}

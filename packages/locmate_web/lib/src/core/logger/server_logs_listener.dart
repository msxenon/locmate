import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ServerLogsListener {
  late final WebSocketChannel _channel;

  void init() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://localhost:${UrlPaths.port}/logs'),
    );

    _channel.stream.listen((message) {
      LoggerService.instance.server.i(message);
    }, onError: (error) {
      LoggerService.instance.server.e(error.toString());
    }, onDone: () {
      LoggerService.instance.server.i('Server logs connection closed');
    });
  }

  void dispose() {
    _channel.sink.close();
  }
}

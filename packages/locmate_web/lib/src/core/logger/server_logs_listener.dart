import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web/web.dart';

class ServerLogsListener {
  late final WebSocketChannel _channel;

  void init() {
    final origin = window.location.origin;

    _channel = WebSocketChannel.connect(
      Uri.parse(origin).replace(scheme: 'ws', path: 'logs'),
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

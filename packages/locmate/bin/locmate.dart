import 'package:locmate/src/server_logger.dart';
import 'package:tint/tint.dart';
import 'package:emojis/emojis.dart';

import 'server.dart';

Future main(List<String> args) async {
  final server = Server();
  await server.run();
  ServerLogger.instance.log('${Emojis.rocket} Open ${server.url.bold().underline()} in your browser to get started.');
}

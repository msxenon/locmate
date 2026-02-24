import 'dart:async';

import 'package:locmate/src/server.dart';
import 'package:locmate/src/server_logger.dart';
import 'package:tint/tint.dart';
import 'package:emojis/emojis.dart';

Future main(List<String> args) async {
  runZonedGuarded(
    () async {
      final server = Server();
      await server.run();
      ServerLogger.instance.log(
        '${Emojis.rocket} Open ${server.url.bold().underline()} in your browser to get started.',
      );
    },
    (error, stack) {
      // 3. This is the global error handler function
      print('--- 🚨 GLOBAL UNHANDLED ERROR CAUGHT ---');
      print('Error Type: ${error.runtimeType}');
      print('Error Message: $error');
      print('Stack Trace: \n$stack');
      print('-----------------------------------------');
    },
  );
}

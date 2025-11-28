import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';

class ServerLogger extends StatefulWidget {
  const ServerLogger({super.key});

  @override
  State<ServerLogger> createState() => _ServerLoggerState();
}

class _ServerLoggerState extends State<ServerLogger> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LoggerService.instance.serverOutput.stream,
      builder: (context, snapshot) {
        return ListView(
          children: [
            if (snapshot.hasData) ...snapshot.data!.map((line) => Text(line)),
          ],
        );
      },
    );
  }
}

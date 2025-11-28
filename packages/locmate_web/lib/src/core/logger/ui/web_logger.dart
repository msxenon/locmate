import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';

class WebLogger extends StatefulWidget {
  const WebLogger({super.key});

  @override
  State<WebLogger> createState() => _WebLoggerState();
}

class _WebLoggerState extends State<WebLogger> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: StreamBuilder(
        stream: LoggerService.instance.webOutput.stream,
        builder: (context, snapshot) {
          return ListView(
            children: [
              if (snapshot.hasData) ...snapshot.data!.map((line) => Text(line)),
            ],
          );
        },
      ),
    );
  }
}

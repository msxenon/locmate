import 'package:flutter/material.dart';

class LogScreen extends StatelessWidget {
  final Stream<List<String>> stream;
  const LogScreen({super.key, required this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        return ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: ListView(
            reverse: true,
            children: [
              if (snapshot.hasData) ...snapshot.data!.map((line) => Text(line)),
            ],
          ),
        );
      },
    );
  }
}

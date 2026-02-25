import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:locmate_web/src/core/logger/ui/all_loggers.dart';
import 'package:async/async.dart' show StreamGroup;

@RoutePage()
class LoggerScreen extends StatefulWidget {
  const LoggerScreen({super.key});

  @override
  State<LoggerScreen> createState() => _LoggerScreenState();
}

class _LoggerScreenState extends State<LoggerScreen> {
  final mergedStream = StreamGroup.merge([
    LoggerService.instance.webOutput.stream,
    LoggerService.instance.serverOutput.stream,
  ]).asBroadcastStream();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Text('All')),
                Tab(icon: Text('Web')),
                Tab(icon: Text('Server')),
              ],
            ),
            title: const Text('Loggers'),
            actions: [
              IconButton(
                icon: const Icon(Icons.web),
                onPressed: () {
                  LoggerService.instance.server.i('Server logger action');
                },
              ),
            ],
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            children: [
              LogScreen(stream: mergedStream),
              LogScreen(stream: LoggerService.instance.webOutput.stream),
              LogScreen(stream: LoggerService.instance.serverOutput.stream),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    mergedStream.drain();
    super.dispose();
  }
}

// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:logger/logger.dart';
import 'package:rxdart/subjects.dart';

class LoggerService {
  static final LoggerService instance = LoggerService._();
  LoggerService._internal(this.web, this.server,
      {required this.webOutput, required this.serverOutput});
  factory LoggerService._() {
    final printer = PrettyPrinter(
      methodCount: 2,
      colors: true,
      printEmojis: true,
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    );
    final webOutput = _StreamOutput();
    final serverOutput = _StreamOutput();
    final web = Logger(printer: printer, output: webOutput);

    final server = Logger(printer: printer, output: serverOutput);
    return LoggerService._internal(
      web,
      server,
      webOutput: webOutput,
      serverOutput: serverOutput,
    );
  }
  final _StreamOutput webOutput;
  final _StreamOutput serverOutput;
  final Logger web;
  final Logger server;
}

class _StreamOutput extends LogOutput {
  final BehaviorSubject<List<String>> _controller = BehaviorSubject.seeded([]);
  final x = ConsoleOutput();

  _StreamOutput() {
    x.init();
  }

  Stream<List<String>> get stream => _controller.stream;

  @override
  void output(OutputEvent event) {
    final currentLogs = _controller.value;
    currentLogs.addAll(event.lines);
    _controller.add(currentLogs);

    x.output(event);
  }

  @override
  Future<void> destroy() {
    x.destroy();
    return _controller.close();
  }
}

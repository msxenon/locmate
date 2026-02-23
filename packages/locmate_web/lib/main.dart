import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/app_container.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';

import 'src/core/logger/server_logs_listener.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (details) {
    LoggerService.instance.web.e(
      details.summary.toString(),
      error: details.exception,
      stackTrace: details.stack,
    );
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework
  PlatformDispatcher.instance.onError = (errorObject, stack) {
    LoggerService.instance.web.e(
      'Unhandled error',
      error: errorObject,
      stackTrace: stack,
    );
    return true;
  };
  ServerLogsListener().init();
  initializeMappers();
  runApp(AppContainer());
}

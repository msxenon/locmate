import 'package:dio/dio.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';

final dioLoggerInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, handler) {
    LoggerService.instance.web.i(
      "[DIO] Request: ${options.method} ${options.uri}, Data: ${options.data}, Headers: ${options.headers}",
    );

    handler.next(options);
  },
  onResponse: (Response response, handler) async {
    LoggerService.instance.web.i(
      "[DIO] Response: ${response.requestOptions.method} ${response.requestOptions.uri}, Data: ${response.data}",
    );
    handler.next(response);
  },
  onError: (DioException error, handler) async {
    LoggerService.instance.web.e(
      "[DIO] Error: ${error.error}: ${error.response.toString()}",
    );
    handler.next(error);
  },
);

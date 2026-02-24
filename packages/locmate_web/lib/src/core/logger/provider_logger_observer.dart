import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';

/// Logs all provider lifecycle and update events to the web logger.
final class ProviderLoggerObserver extends ProviderObserver {
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    LoggerService.instance.web.i(
      '[Riverpod] didAddProvider $provider value=$value',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    LoggerService.instance.web.i(
      '[Riverpod] didUpdateProvider $provider '
      'previous=$previousValue new=$newValue',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    LoggerService.instance.web.i('[Riverpod] didDisposeProvider $provider');
  }

  @override
  void providerDidFail(
    ProviderBase<Object?> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    LoggerService.instance.web.e(
      '[Riverpod] providerDidFail $provider',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

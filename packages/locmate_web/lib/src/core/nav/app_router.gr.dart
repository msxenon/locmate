// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LandingScreen]
class LandingRoute extends PageRouteInfo<void> {
  const LandingRoute({List<PageRouteInfo>? children})
      : super(LandingRoute.name, initialChildren: children);

  static const String name = 'LandingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LandingScreen();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingScreen();
    },
  );
}

/// generated route for
/// [LoggerScreen]
class LoggerRoute extends PageRouteInfo<void> {
  const LoggerRoute({List<PageRouteInfo>? children})
      : super(LoggerRoute.name, initialChildren: children);

  static const String name = 'LoggerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoggerScreen();
    },
  );
}

/// generated route for
/// [NotFoundScreen]
class NotFoundRoute extends PageRouteInfo<NotFoundRouteArgs> {
  NotFoundRoute({required String text, Key? key, List<PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          args: NotFoundRouteArgs(text: text, key: key),
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NotFoundRouteArgs>();
      return NotFoundScreen(text: args.text, key: args.key);
    },
  );
}

class NotFoundRouteArgs {
  const NotFoundRouteArgs({required this.text, this.key});

  final String text;

  final Key? key;

  @override
  String toString() {
    return 'NotFoundRouteArgs{text: $text, key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NotFoundRouteArgs) return false;
    return text == other.text && key == other.key;
  }

  @override
  int get hashCode => text.hashCode ^ key.hashCode;
}

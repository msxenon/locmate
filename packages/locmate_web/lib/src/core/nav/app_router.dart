import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/logger/ui/logger_screen.dart';
import 'package:locmate_web/src/core/nav/essential_project_files_guard.dart';
import 'package:locmate_web/src/core/nav/loading_screen.dart';
import 'package:locmate_web/src/core/nav/not_found_screen.dart';
import 'package:locmate_web/src/features/editor/ui/home_screen.dart';
import 'package:locmate_web/src/features/landing/ui/landing_screen.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  final WidgetRef ref;
  AppRouter({required this.ref});
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, path: '/', initial: true),
    // AutoRoute(page: NotFoundRoute.page, path: '*'), // Catch-all route
    AutoRoute(page: NotFoundRoute.page, path: '/not_found'),
    AutoRoute(page: LoadingRoute.page, path: '/loading'),
    AutoRoute(page: LoggerRoute.page, path: '/logs'),
  ];

  @override
  List<AutoRouteGuard> get guards => [EssentialProjectFilesGuard(ref: ref)];
}

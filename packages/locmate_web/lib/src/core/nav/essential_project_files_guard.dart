import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EssentialProjectFilesGuard extends AutoRouteGuard {
  final WidgetRef ref;

  EssentialProjectFilesGuard({required this.ref});
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final projectStore = ref.read(projectManagerProvider);
    // final isError = projectStore is AsyncError;
    // final isLoading = projectStore is AsyncLoading;
    // if (projectStore is AsyncData ||
    //     resolver.routeName == NotFoundRoute.name && isError ||
    //     resolver.routeName == LoadingRoute.name && isLoading) {
    resolver.next();
    // } else if (projectStore is AsyncLoading) {
    //   // resolver.next();
    //   resolver.redirectUntil(LoadingRoute());
    // } else {
    //   resolver.next();
    //   final error = projectStore is AsyncError ? projectStore.error : null;
    //   resolver.redirectUntil(NotFoundRoute(text: error.toString()));
    // }
  }
}

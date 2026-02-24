import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:locmate_web/src/features/editor/ui/app_version_widget.dart';
import 'package:locmate_web/src/features/editor/ui/create_project_widget.dart';
import 'package:locmate_web/src/features/editor/ui/project_path_widget.dart';
import 'package:locmate_web/src/features/languages/ui/languages_view.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncProviderBuilder<ProjectResponse>(
      (context, state) => Center(
        child: switch (state) {
          ProjectData x => LangsDataWidget(x),
          ProjectEmpty() => CreateProjectWidget(),
        },
      ),

      provider: projectManagerProvider,
      wrapper: (context, value, child) {
        return Scaffold(
          body: SafeArea(
            minimum: EdgeInsets.all(8),
            child: child ?? SizedBox(),
          ),
          bottomNavigationBar: SafeArea(
            minimum: EdgeInsets.all(8),
            child: Row(
              spacing: 2,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ProjectPathWidget(),
                Spacer(),
                const AppVersionWidget(),
              ],
            ),
          ),
        );
      },
    );
  }
}

typedef ProviderWidgetBuilder<S> =
    Widget Function(BuildContext context, S state);
typedef BlocWidgetListener<S> = void Function(BuildContext context, S state);

class AsyncProviderBuilder<Val extends Object> extends ConsumerWidget {
  const AsyncProviderBuilder(
    this.dataBuilder, {
    this.wrapper,
    super.key,
    required this.provider,
    this.listener,
    this.loadingBuilder,
  });
  final ProviderWidgetBuilder<Val> dataBuilder;
  final ProviderListenable<AsyncValue<Val>> provider;
  final ValueWidgetBuilder<AsyncValue<Val>>? wrapper;
  final BlocWidgetListener<AsyncValue<Val>>? listener;
  final WidgetBuilder? loadingBuilder;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(provider);
    if (listener != null) {
      ref.listen(provider, (_, next) {
        listener!(context, next);
      });
    }

    return state.when(
      data: (data) => wrapInWrapper(context, dataBuilder(context, data), state),
      loading: () => wrapInWrapper(
        context,
        loadingBuilder?.call(context) ??
            const Center(child: CircularProgressIndicator()),
        state,
      ),
      error: (e, _) =>
          wrapInWrapper(context, Center(child: Text(e.toString())), state),
    );
  }

  Widget wrapInWrapper(
    BuildContext context,
    Widget child,
    AsyncValue<Val> state,
  ) {
    if (wrapper == null) return child;
    return wrapper!(context, state, child);
  }
}

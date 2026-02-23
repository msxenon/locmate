import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/app_widget.dart';

class AppContainer extends StatefulWidget {
  final ProviderContainer? testContainer;
  const AppContainer({super.key, @visibleForTesting this.testContainer});

  @override
  State<AppContainer> createState() => _AppContainerState();
}

class _AppContainerState extends State<AppContainer> {
  late ProviderContainer container;
  @override
  void initState() {
    container = widget.testContainer ?? ProviderContainer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: container,
      child: MyApp(),
    );
  }

  @override
  void dispose() {
    container.dispose();
    super.dispose();
  }
}

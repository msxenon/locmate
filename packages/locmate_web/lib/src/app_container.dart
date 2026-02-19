import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/app_widget.dart';

class AppContainer extends StatelessWidget {
  final ProviderContainer? testContainer;
  const AppContainer({super.key, @visibleForTesting this.testContainer});

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: testContainer ?? ProviderContainer(),
      child: MyApp(),
    );
  }
}

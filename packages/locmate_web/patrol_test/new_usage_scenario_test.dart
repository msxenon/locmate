import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/app_container.dart';
import 'package:patrol/patrol.dart';

void main() {
  patrolTest(
    'when the server is not connected, the app should show a message',
    ($) async {
      await $.pumpWidgetAndSettle(AppContainer());
      final errorTextFinder = find.textContaining(
        'Failed',
        findRichText: true,
        skipOffstage: false,
      );
      await $.waitUntilVisible(errorTextFinder);
      expect(errorTextFinder, findsNWidgets(2));
    },
  );
}

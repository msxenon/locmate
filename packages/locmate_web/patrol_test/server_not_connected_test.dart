// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/app_container.dart';
import 'package:locmate_web/src/core/env_config.dart';

import 'test_utils/screenshot_on_fail.dart';

void main() {
  patrolTestWithScreenshotOnFail(
    'when the server is not connected, the app should show a failed message',
    ($) async {
      EnvConfig.setTestInstance(EnvConfigEnum.server, 'http://localhost:0');

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

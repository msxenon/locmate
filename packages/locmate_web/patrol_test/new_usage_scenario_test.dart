// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/app_container.dart';
import 'package:locmate_web/src/core/env_config.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';
import 'package:mocktail/mocktail.dart';

import '../test/utils/mocks.dart';
import 'test_utils/locmate_cli_helper.dart';
import 'test_utils/screenshot_on_fail.dart';
import 'test_utils/screenshot_wrapper_widget.dart';

void main() {
  // patrolTestWithScreenshotOnFail(
  //   'when the server is not connected, the app should show a failed message',
  //   ($) async {
  //     await $.pumpWidgetAndSettle(AppContainer());
  //     final errorTextFinder = find.textContaining(
  //       'Failed',
  //       findRichText: true,
  //       skipOffstage: false,
  //     );
  //     await $.waitUntilVisible(errorTextFinder);
  //     expect(errorTextFinder, findsNWidgets(2));
  //   },
  // );

  patrolTestWithScreenshotOnFail(
    'when server is connect, but the project is not found, the app should show create project message',
    ($) async {
      final locmateServer = await LocmateCliHelper.runLocmateCli();
      addTearDown(() => locmateServer.kill());
      EnvConfig.setTestInstance(
        EnvConfigEnum.server,
        locmateServer.url,
      );
      await $.pumpWidgetAndSettle(
        ScreenshotWrapperWidget(
          child: AppContainer(),
        ),
      );

      final errorTextFinder = find.textContaining(
        'Create project',
        findRichText: true,
        skipOffstage: false,
      );
      await $.waitUntilVisible(errorTextFinder);
      expect(errorTextFinder, findsNWidgets(1));
    },
  );

  // patrolTestWithScreenshotOnFail(
  //   'when server is connect, but the project is not found, the app should show create project message',
  //   ($) async {
  //     EnvConfig.setTestInstance(EnvConfigEnum.sharedPrefs);
  //     final sharedPrefrencesWrapper = MockSharedPrefrencesWrapper();
  //     when(() => sharedPrefrencesWrapper.getString(any()))
  //         .thenAnswer((i) async {
  //       print('XXXXXXXXX getString called with ${i.positionalArguments.first}');
  //       return null;
  //     });
  //     when(() => sharedPrefrencesWrapper.setString(any(), any()))
  //         .thenAnswer((i) async {
  //       print(
  //           'XXXXXXXXX setString called with ${i.positionalArguments.first} and ${i.positionalArguments.last}');
  //       return;
  //     });
  //     when(() => sharedPrefrencesWrapper.getKeys()).thenAnswer((_) async {
  //       print('XXXXXXXXX getKeys called');
  //       return {};
  //     });
  //     when(() => sharedPrefrencesWrapper.remove(any())).thenAnswer((i) async {
  //       print('XXXXXXXXX remove called with ${i.positionalArguments.first}');
  //       return;
  //     });
  //     when(() => sharedPrefrencesWrapper.getInt(any())).thenAnswer((i) async {
  //       print('XXXXXXXXX getInt called with ${i.positionalArguments.first}');
  //       return null;
  //     });
  //     when(() => sharedPrefrencesWrapper.setInt(any(), any()))
  //         .thenAnswer((i) async {
  //       print(
  //           'XXXXXXXXX setInt called with ${i.positionalArguments.first} and ${i.positionalArguments.last}');
  //     });
  //     final container = ProviderContainer(
  //       overrides: [
  //         sharedPrefrencesWrapperProvider
  //             .overrideWithValue(sharedPrefrencesWrapper),
  //       ],
  //     );
  //     await $.pumpWidgetAndSettle(
  //       ScreenshotWrapperWidget(
  //         child: AppContainer(testContainer: container),
  //       ),
  //     );

  //     final errorTextFinder = find.textContaining(
  //       'Create project',
  //       findRichText: true,
  //       skipOffstage: false,
  //     );
  //     await $.waitUntilVisible(errorTextFinder);
  //     expect(errorTextFinder, findsNWidgets(1));
  //   },
  // );
}

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/app_container.dart';
import 'package:locmate_web/src/core/env_config.dart';

import 'test_utils/file_helper.dart';
import 'test_utils/json_string_mapper.dart';
import 'test_utils/locmate_cli_helper.dart';
import 'test_utils/screenshot_on_fail.dart';
import 'test_utils/screenshot_wrapper_widget.dart';

void main() {
  patrolTestWithScreenshotOnFail(
    'when the server is not connected, the app should show a failed message',
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

  patrolTestWithScreenshotOnFail(
    'when server is connect, but the project is not found, the app should show create project message, and create a new project when the user taps on the create project button',
    ($) async {
      final appSandboxPath = 'packages/locmate_web/patrol_test/sandbox';
      final locmateCliHelper = LocmateCliHelper();
      final locmateServer =
          await locmateCliHelper.runLocmateCli(appSandboxPath);
      addTearDown(() async {
        await locmateCliHelper.deleteInPath(appSandboxPath);
        locmateServer.kill();
      });
      EnvConfig.setTestInstance(
        EnvConfigEnum.server,
        locmateServer.url,
      );
      await $.pumpWidgetAndSettle(
        ScreenshotWrapperWidget(
          child: AppContainer(),
        ),
      );

      final createProjectFinder = find.textContaining(
        'Create project',
        findRichText: true,
        skipOffstage: false,
      );
      await $.waitUntilVisible(createProjectFinder);
      await $.tap(createProjectFinder);
      final fileHelper = FileHelper();
      await fileHelper.expectPathContentEquals(
        '$appSandboxPath/locmate.json',
        JsonStringMapper.mapToString({
          "keyFormat": "camelCase",
          "localesOrder": ["en"],
          "projectName": "New project"
        }),
      );

      await fileHelper.expectPathContentEquals(
        '$appSandboxPath/l10n.yaml',
        'arb-dir: lib/l10n\ntemplate-arb-file: app_en.arb\n',
      );
      await fileHelper.expectPathContentEquals(
        '$appSandboxPath/lib/l10n/app_en.arb',
        JsonStringMapper.mapToString({"@@locale": "en"}),
      );
    },
  );

  patrolTestWithScreenshotOnFail(
    'when integrating with an existing project, the app should load the project and show the project name',
    ($) async {
      final appSandboxPath = 'packages/locmate_web/patrol_test/sandbox';
      final locmateCliHelper = LocmateCliHelper();
      final locmateServer =
          await locmateCliHelper.runLocmateCli(appSandboxPath);
      final fileHelper = FileHelper();
      await fileHelper.writePathContent(
        '$appSandboxPath/locmate.json',
        JsonStringMapper.mapToString({
          "keyFormat": "camelCase",
          "localesOrder": ["en"],
          "projectName": "New project"
        }),
      );
      await fileHelper.writePathContent(
        '$appSandboxPath/l10n.yaml',
        'arb-dir: lib/l10n\ntemplate-arb-file: app_en.arb\n',
      );
      await fileHelper.writePathContent(
        '$appSandboxPath/lib/l10n/app_en.arb',
        JsonStringMapper.mapToString(
          {"@@locale": "en", "appHelloKey": "Hello World"},
        ),
      );
      addTearDown(() async {
        await locmateCliHelper.deleteInPath(appSandboxPath);
        locmateServer.kill();
      });
      EnvConfig.setTestInstance(
        EnvConfigEnum.server,
        locmateServer.url,
      );
      await $.pumpWidgetAndSettle(
        ScreenshotWrapperWidget(
          child: AppContainer(),
        ),
      );
      final projectNameFinder = find.textContaining(
        'appHelloKey',
        findRichText: true,
        skipOffstage: false,
      );
      await $.waitUntilVisible(projectNameFinder);
      expect(projectNameFinder, findsNWidgets(2));
      expect(find.textContaining(appSandboxPath, findRichText: true),
          findsOneWidget);
      expect(
          find.textContaining('Version:', findRichText: true), findsOneWidget);
    },
  );
}

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
    'when integrating with a project that has arb files, the app should load the project and show the project keys (the project has intl_en.arb file)',
    ($) async {
      final appSandboxPath = 'packages/locmate_web/patrol_test/sandbox';
      final locmateCliHelper = LocmateCliHelper();
      final locmateServer = await locmateCliHelper.runLocmateCli(
        appSandboxPath,
      );
      final fileHelper = FileHelper();
      await fileHelper.writePathContent(
        '$appSandboxPath/locmate.json',
        JsonStringMapper.mapToString({
          "keyFormat": "camelCase",
          "localesOrder": ["ar", "en"],
          "projectName": "New project",
        }),
      );
      await fileHelper.writePathContent(
        '$appSandboxPath/l10n.yaml',
        'arb-dir: lib/l10n\n'
            'template-arb-file: intl_en.arb\n'
            'output-localization-file: l10n.dart\n'
            'output-class: AppLocalizations\n'
            'preferred-supported-locales: [ en, ar ]\n'
            'required-resource-attributes: false\n'
            'synthetic-package: false\n'
            'output-dir: lib/generated/intl\n',
      );
      await fileHelper.writePathContent(
        '$appSandboxPath/lib/l10n/intl_en.arb',
        JsonStringMapper.mapToString({
          "@@locale": "en",
          "appHelloKey": "Hello World",
          "@appHelloKey": {},
        }),
      );
      addTearDown(() async {
        await locmateCliHelper.deleteInPath(appSandboxPath);
        locmateServer.kill();
      });
      EnvConfig.setTestInstance(EnvConfigEnum.server, locmateServer.url);
      await $.pumpWidgetAndSettle(
        ScreenshotWrapperWidget(child: AppContainer()),
      );

      final localizedKeysFinder = find.textContaining(
        'appHelloKey',
        findRichText: true,
        skipOffstage: false,
      );
      await $.waitUntilVisible(localizedKeysFinder);
      expect(localizedKeysFinder, findsNWidgets(2));
    },
  );
}

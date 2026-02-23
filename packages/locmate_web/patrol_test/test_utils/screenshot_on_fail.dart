// ignore_for_file: invalid_use_of_visible_for_testing_member, depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:host_bridge/host_bridge.dart';
import 'package:patrol/patrol.dart';
import 'package:meta/meta.dart';

import 'screenshot_wrapper_widget.dart';

/// Takes a screenshot from the current [WidgetTester] and saves it via host_bridge.
/// Encodes PNG bytes as base64, writes to a temp .b64 file, then runs a command
/// on the host to decode to the final .png (since host_bridge only supports string file writes).
final _verbose = false;
void verbosePrint(String message) {
  if (_verbose) {
    print('[Screenshot on fail] $message');
  }
}

Future<void> takeScreenshot(
  PatrolIntegrationTester tester,
  String testName,
) async {
  verbosePrint('takeScreenshot: $testName');
  try {
    final screenshotWrapperWidget = tester.tester
        .state<ScreenshotWrapperWidgetState>(
            find.byType(ScreenshotWrapperWidget));
    final screenshotController = screenshotWrapperWidget.screenshotController;
    final sanitized = _sanitizeFileName(testName);

    final image = await screenshotController.capture();
    if (image == null) {
      verbosePrint('takeScreenshot: image is null');
      return;
    }

    final base64String = base64Encode(image);

    final hostBridgeUrl = const String.fromEnvironment('HOST_BRIDGE_URL');
    if (hostBridgeUrl.isEmpty) {
      verbosePrint('takeScreenshot: hostBridgeUrl is empty');
      return;
    }

    final client = HostBridgeClient(hostBridgeUrl);
    const screenshotsDir = 'packages/locmate_web/patrol_test/failures';
    final pngPath = '$screenshotsDir/$sanitized.png';

    final mkdirResult = await client.runCommand(
      RunCommandRequestModel(
        command: 'mkdir -p $screenshotsDir',
      ),
    );
    verbosePrint('takeScreenshot mkdir result: $mkdirResult');
    final result = await client.runCommand(
      RunCommandRequestModel(
        command: 'echo "$base64String" | base64 -d > $pngPath',
      ),
    );
    verbosePrint('takeScreenshot result: $result');
  } catch (e, st) {
    // Don't fail the test if screenshot fails (e.g. on web without dart:io)
    // ignore: avoid_print
    verbosePrint('Screenshot on fail error: $e\n$st');
  }
}

String _sanitizeFileName(String name) {
  return name
      .replaceAll(RegExp(r'[^\w\s-]'), '')
      .replaceAll(RegExp(r'\s+'), '_')
      .trim()
      .toLowerCase();
}

@isTest
void patrolTestWithScreenshotOnFail(
  String testDescription,
  PatrolTesterCallback body,
) {
  patrolTest(testDescription, ($) async {
    try {
      return await body($);
    } catch (_) {
      // Take screenshot inside callback so we run before test framework swallows the error
      await takeScreenshot($, testDescription);
      rethrow;
    }
  });
}

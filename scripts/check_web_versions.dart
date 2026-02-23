// ignore_for_file: avoid_print

/// Ensures locmate, locmate_web, and packages/locmate/web_output have the same version.
///
/// Reads version from:
///   - packages/locmate_web/pubspec.yaml (version: field)
///   - packages/locmate/web_output/version.json (version key)
///
/// Usage (from repo root):
///   dart run scripts/check_versions.dart [repo_root]
///
/// Exit code: 0 if all match, 1 if mismatch or missing.

import 'dart:convert';
import 'dart:io';

void main(List<String> arguments) {
  final repoRoot = arguments.isNotEmpty
      ? Directory(arguments.first).absolute.path
      : Directory.current.path;

  final locmateWebPubspec = File(
      '$repoRoot${Platform.pathSeparator}packages${Platform.pathSeparator}locmate_web${Platform.pathSeparator}pubspec.yaml');
  final webOutputVersion = File(
      '$repoRoot${Platform.pathSeparator}packages${Platform.pathSeparator}locmate${Platform.pathSeparator}web_output${Platform.pathSeparator}version.json');

  final locmateWebVersion = _versionFromPubspec(locmateWebPubspec);
  final webOutputVersionStr = _versionFromJson(webOutputVersion);

  if (locmateWebVersion == null) {
    stderr.writeln(
        'Could not read version from packages/locmate_web/pubspec.yaml');
    exit(1);
  }
  if (webOutputVersionStr == null) {
    stderr.writeln(
        'Could not read version from packages/locmate/web_output/version.json (file missing or invalid)');
    exit(1);
  }

  final versions = {
    'packages/locmate_web': locmateWebVersion,
    'packages/locmate/web_output': webOutputVersionStr,
  };

  final unique = versions.values.toSet();
  if (unique.length == 1) {
    print('All versions match: ${unique.single}');
    exit(0);
  }

  stderr.writeln('Version mismatch:');
  for (final e in versions.entries) {
    stderr.writeln('  ${e.key}: ${e.value}');
  }
  exit(1);
}

String? _versionFromPubspec(File file) {
  if (!file.existsSync()) return null;
  final match = RegExp(r'^version:\s*(\S+)', multiLine: true)
      .firstMatch(file.readAsStringSync());
  return match?.group(1)?.trim();
}

String? _versionFromJson(File file) {
  if (!file.existsSync()) return null;
  try {
    final map = jsonDecode(file.readAsStringSync()) as Map<String, dynamic>;
    final v = map['version'];
    return v is String ? v : v?.toString();
  } catch (_) {
    return null;
  }
}

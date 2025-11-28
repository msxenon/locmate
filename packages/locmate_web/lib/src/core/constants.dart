abstract class Constants {
  static const String l10nYamlPath = 'l10n.yaml';

  static String fullArbDirPath(
      {required String projectPath,
      required String arbDir,
      String arbFileName = ''}) {
    final paths = [projectPath, arbDir, arbFileName]
      ..removeWhere((element) => element.isEmpty);
    return paths.join('/');
  }
}

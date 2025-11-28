import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/core/constants.dart';

void main() {
  test('constants ...', () async {
    final path = Constants.fullArbDirPath(projectPath: 'projectPath', arbDir: 'arbDir', arbFileName: 'arbFileName');
    expect(path, 'projectPath/arbDir/arbFileName');
  });

  test('fullArbDirPath empty paths', () async {
    var path = Constants.fullArbDirPath(projectPath: '', arbDir: 'arbDir', arbFileName: 'arbFileName');
    expect(path, 'arbDir/arbFileName');

    path = Constants.fullArbDirPath(projectPath: '', arbDir: '', arbFileName: 'arbFileName');
    expect(path, 'arbFileName');

    path = Constants.fullArbDirPath(projectPath: '', arbDir: '', arbFileName: '');
    expect(path, '');
  });
}

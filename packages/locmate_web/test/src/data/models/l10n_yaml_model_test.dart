import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';

void main() {
  test('l10n yaml model ...', () async {
    final l10nModel =
        L10nYamlModel(arbDir: 'lib/l10n', templateArbFile: 'en.arb');
    expect(
      l10nModel.toYamlContent(),
      'arb-dir: lib/l10n\n' 'template-arb-file: en.arb\n',
    );
  });
}

import 'package:dart_mappable/dart_mappable.dart';
import 'package:yaml/yaml.dart';
import 'package:yaml_edit/yaml_edit.dart';
part 'l10n_yaml_model.mapper.dart';

@MappableClass(caseStyle: CaseStyle.paramCase, ignoreNull: true)
class L10nYamlModel with L10nYamlModelMappable {
  static const defaultFileName = 'l10n.yaml';
  final String arbDir;
  final String templateArbFile;

  L10nYamlModel({
    required this.arbDir,
    required this.templateArbFile,
  });

  factory L10nYamlModel.defaultValues() => L10nYamlModel(
        arbDir: 'lib/l10n',
        templateArbFile: 'intl_en.arb',
      );

  static L10nYamlModel? fromYamlContent(String? yamlContent) {
    if (yamlContent == null) {
      return null;
    }
    final yaml = loadYaml(yamlContent);
    final map = Map<String, dynamic>.from(yaml);
    final defaultValues = L10nYamlModel.defaultValues();
    if (map.isEmpty) {
      return defaultValues;
    }
    if (map[L10nYamlModelMapper._f$templateArbFile.key] == null) {
      map[L10nYamlModelMapper._f$templateArbFile.key] = defaultValues.templateArbFile;
    }
    if (map[L10nYamlModelMapper._f$arbDir.key] == null) {
      map[L10nYamlModelMapper._f$arbDir.key] = defaultValues.arbDir;
    }

    return L10nYamlModelMapper.fromMap(map);
  }

  String toYamlContent() {
    final map = toMap();

    final yamlEditor = YamlEditor('');
    yamlEditor.update([], map);

    return '$yamlEditor\n';
  }
}

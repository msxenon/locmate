import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
part 'locmate_settings_model.mapper.dart';

@MappableClass(ignoreNull: true)
class LocmateSettingsModel with LocmateSettingsModelMappable {
  final String? projectName;
  final KeyFormat? keyFormat;
  final List<String>? localesOrder;
  static String defaultFileName = 'locmate.json';
  static LocmateSettingsModel defaultValues() => LocmateSettingsModel(
        projectName: 'Untitled',
        keyFormat: KeyFormat.none,
      );

  const LocmateSettingsModel({
    required this.projectName,
    required this.keyFormat,
    this.localesOrder,
  });

  static LocmateSettingsModel? tryFromJson(String? fileToMap) {
    if (fileToMap == null) {
      return null;
    }
    return LocmateSettingsModelMapper.fromJson(fileToMap);
  }
}

@MappableClass()
class LocmateSettingsState with LocmateSettingsStateMappable {
  final String projectName;
  final KeyFormat keyFormat;
  final List<String> localesOrder;
  final List<String> selectedLangs;
  const LocmateSettingsState({
    required this.projectName,
    required this.keyFormat,
    required this.localesOrder,
    this.selectedLangs = const [],
  });
}

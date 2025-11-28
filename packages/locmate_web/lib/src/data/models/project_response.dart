import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';

import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:locmate_web/src/data/models/crud_file_locale_model.dart';
part 'project_response.mapper.dart';

@MappableClass(ignoreNull: true, discriminatorKey: 'type')
sealed class ProjectResponse with ProjectResponseMappable {
  final String projectPath;

  const ProjectResponse({
    required this.projectPath,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: 'data')
class ProjectData extends ProjectResponse with ProjectDataMappable {
  final LocmateSettingsModel? locmateSettingsModel;
  final L10nYamlModel l10nYaml;
  final List<ArbFileEntity> arbFileEntities;
  const ProjectData({
    required this.locmateSettingsModel,
    required super.projectPath,
    required this.l10nYaml,
    required this.arbFileEntities,
  });
}

@MappableClass(ignoreNull: true, discriminatorValue: 'empty')
class ProjectEmpty extends ProjectResponse with ProjectEmptyMappable {
  const ProjectEmpty({
    required super.projectPath,
  });
}

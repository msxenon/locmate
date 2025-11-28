import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/repositories/project_repository_impl.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_repository.g.dart';

@Riverpod(keepAlive: true)
ProjectRepository projectRepository(Ref ref) => ProjectRepositoryImpl(ref);

abstract class ProjectRepository {
  final Ref ref;
  ProjectRepository(this.ref);
  Future<void> saveLocmateModel(LocmateSettingsModel locmateSettingsModel);
  Future<LocmateSettingsModel?> getLocmateModel();
  Future<void> saveL10nModel(L10nYamlModel l10nYaml);
  Future<L10nYamlModel?> getL10nModel();
  Future<void> createFile({required String path, required String content});
  Future<List<String>> listArbFiles(String fullArbDirPath);
}

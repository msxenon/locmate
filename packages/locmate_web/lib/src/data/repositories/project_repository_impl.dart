import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ProjectRepositoryImpl(super.ref);
  ProjectDataSource get _projectDatasourceProvider =>
      ref.read(projectDatasourceProvider);
  @override
  Future<L10nYamlModel?> getL10nModel() async {
    try {
      final opResponse = await _projectDatasourceProvider
          .fileOp(FileOpContextRead(path: L10nYamlModel.defaultFileName));

      if (opResponse is StringOpResponse) {
        return L10nYamlModel.fromYamlContent(opResponse.response);
      }
      return null;
    } catch (e, s) {
      LoggerService.instance.web.e(
        'Error while reading l10n model',
        error: e,
        stackTrace: s,
      );
      return null;
    }
  }

  @override
  Future<LocmateSettingsModel?> getLocmateModel() async {
    try {
      final opResponse = await _projectDatasourceProvider.fileOp(
          FileOpContextRead(path: LocmateSettingsModel.defaultFileName));
      if (opResponse is StringOpResponse) {
        return LocmateSettingsModelMapper.fromJson(opResponse.response);
      }
      return null;
    } catch (e, s) {
      LoggerService.instance.web.e(
        'Error while reading l10n model',
        error: e,
        stackTrace: s,
      );
      return null;
    }
  }

  @override
  Future<void> saveL10nModel(L10nYamlModel l10nYaml) {
    return _projectDatasourceProvider.fileOp(
      FileOpContextWrite(
        content: l10nYaml.toJson(),
        path: L10nYamlModel.defaultFileName,
      ),
    );
  }

  @override
  Future<void> saveLocmateModel(LocmateSettingsModel locmateSettingsModel) {
    return _projectDatasourceProvider.fileOp(
      FileOpContextWrite(
        content: locmateSettingsModel.toJson(),
        path: LocmateSettingsModel.defaultFileName,
      ),
    );
  }

  @override
  Future<void> createFile({required String path, required String content}) {
    return _projectDatasourceProvider.fileOp(
      FileOpContextWrite(
        content: content,
        path: path,
      ),
    );
  }

  @override
  Future<List<String>> listArbFiles(String fullArbDirPath) {
    return _projectDatasourceProvider
        .dirOp(DirOpContextRead(path: fullArbDirPath))
        .then((value) {
      if (value is ListOpResponse) {
        return value.response;
      }
      return <String>[];
    });
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  final Ref ref;
  ProjectRepositoryImpl(this.ref);
  ProjectDataSource get _projectDatasourceProvider =>
      ref.read(projectDatasourceProvider);
  @override
  Future<L10nYamlModel?> getL10nModel() async {
    try {
      final opResponse = await _projectDatasourceProvider.fileOp(
        FileOpContextRead(path: L10nYamlModel.defaultFileName),
      );

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
        FileOpContextRead(path: LocmateSettingsModel.defaultFileName),
      );
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
      FileOpContextWriteString(
        content: l10nYaml.toYamlContent(),
        path: L10nYamlModel.defaultFileName,
      ),
    );
  }

  @override
  Future<void> saveLocmateModel(LocmateSettingsModel locmateSettingsModel) {
    return _projectDatasourceProvider.fileOp(
      FileOpContextWriteMap(
        content: locmateSettingsModel.toMap(),
        path: LocmateSettingsModel.defaultFileName,
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

  @override
  Future<void> saveArbFileContent(String path, Map<String, dynamic> content) {
    return ref
        .read(projectDatasourceProvider)
        .fileOp(FileOpContextWriteMap(path: path, content: content));
  }

  @override
  Future<String?> getProjectPubspec() async {
    try {
      final opResponse = await _projectDatasourceProvider.fileOp(
        FileOpContextRead(path: 'pubspec.yaml'),
      );
      if (opResponse is StringOpResponse) {
        return opResponse.response;
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
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/constants.dart';
import 'package:locmate_web/src/core/logger/logger_service.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/crud_file_locale_model.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yaml/yaml.dart';

part 'project_manager.g.dart';

@Riverpod(keepAlive: true)
class ProjectManager extends _$ProjectManager {
  @override
  FutureOr<ProjectResponse> build() async {
    final x = await ref.read(projectDatasourceProvider).getProjectPath();

    try {
      final locmateSettingsModel = await ref
          .read(projectRepositoryProvider)
          .getLocmateModel();
      final l10nYaml = await ref.read(projectRepositoryProvider).getL10nModel();
      if (l10nYaml == null) {
        return ProjectEmpty(projectPath: x);
      }

      return ProjectData(
        locmateSettingsModel: locmateSettingsModel,
        projectPath: x,
        l10nYaml: l10nYaml,
        arbFileEntities: await loadString(
          projectPath: x,
          arbDir: l10nYaml.arbDir,
          locmateModel: locmateSettingsModel,
        ),
      );
    } catch (e) {
      if (!kReleaseMode) {
        rethrow;
      }
      return ProjectEmpty(projectPath: x);
    }
  }

  ProjectData? _getValidState() {
    if (state is AsyncData && (state as AsyncData).value is ProjectData) {
      return state.value as ProjectData;
    }
    return null;
  }

  String? _getArbFullPath(String arbFileName) {
    final project = _getValidState();
    if (project == null) {
      return null;
    }
    final fullPath = Constants.fullArbDirPath(
      projectPath: project.projectPath,
      arbDir: project.l10nYaml.arbDir,
      arbFileName: arbFileName,
    );
    return fullPath;
  }

  Future<void> addLanguage(String locale) async {
    final fullPath = _getArbFullPath('app_${locale}_.arb');

    if (fullPath == null) {
      return;
    }
    await ref.read(projectRepositoryProvider).saveArbFileContent(fullPath, {
      '@@locale': locale,
    });

    ref.invalidateSelf();
  }

  Future<void> saveLocmateModel(
    LocmateSettingsModel locmateSettingsModel,
  ) async {
    await ref
        .read(projectRepositoryProvider)
        .saveLocmateModel(locmateSettingsModel);

    ref.invalidateSelf();
  }

  Future<void> createNewProject() async {
    final pubspecProjectName = await getPubspecProjectName();
    final demoLocmateYaml = LocmateSettingsModel(
      projectName: pubspecProjectName ?? 'New project',
      keyFormat: KeyFormat.camelCase,
      localesOrder: ['en'],
    );
    final demoL10nYaml = L10nYamlModel(
      arbDir: 'lib/l10n',
      templateArbFile: 'app_en.arb',
    );
    final arbFileEn = '${demoL10nYaml.arbDir}/app_en.arb';

    await ref.read(projectRepositoryProvider).saveLocmateModel(demoLocmateYaml);
    await ref.read(projectRepositoryProvider).saveL10nModel(demoL10nYaml);
    await ref.read(projectRepositoryProvider).saveArbFileContent(arbFileEn, {
      '@@locale': 'en',
    });
    ref.invalidateSelf();
  }

  Future<List<ArbFileEntity>> loadString({
    required String projectPath,
    required String arbDir,
    required LocmateSettingsModel? locmateModel,
  }) async {
    final result = <ArbFileEntity>[];
    final arbFileNamesList = await ref
        .read(projectRepositoryProvider)
        .listArbFiles(
          Constants.fullArbDirPath(projectPath: projectPath, arbDir: arbDir),
        );
    final fullArbFilesPaths = arbFileNamesList
        .map(
          (e) => Constants.fullArbDirPath(
            arbDir: arbDir,
            projectPath: projectPath,
            arbFileName: e,
          ),
        )
        .toList();
    final arbFileOps = await Future.wait(
      fullArbFilesPaths.map(
        (e) => ref
            .read(projectDatasourceProvider)
            .fileOp(FileOpContextRead(path: e)),
      ),
    );
    int index = 0;
    for (final arbFileOp in arbFileOps) {
      try {
        if (arbFileOp is! StringOpResponse) {
          continue;
        }
        result.add(
          ArbFileEntity(
            values: jsonDecode(arbFileOp.response),
            fileName: arbFileNamesList[index],
          ),
        );
      } catch (e, s) {
        LoggerService.instance.web.e(
          'Error while reading arb file',
          error: e,
          stackTrace: s,
        );
      } finally {
        index++;
      }
    }

    if (locmateModel?.localesOrder?.isNotEmpty == true) {
      result.sort((a, b) {
        final aIndex = locmateModel!.localesOrder!.indexOf(
          a.locale.toLanguageTag(),
        );
        final bIndex = locmateModel.localesOrder!.indexOf(
          b.locale.toLanguageTag(),
        );
        return aIndex - bIndex;
      });
    }

    return result;
  }

  Future<String?> getPubspecProjectName() async {
    try {
      final pubspec = await ref
          .read(projectRepositoryProvider)
          .getProjectPubspec();
      if (pubspec == null || pubspec.trim().isEmpty) {
        return null;
      }
      final yaml = loadYaml(pubspec);
      final map = Map<String, dynamic>.from(yaml);
      return map['name'];
    } catch (e) {
      LoggerService.instance.web.e('Error while reading pubspec', error: e);
      return null;
    }
  }
}

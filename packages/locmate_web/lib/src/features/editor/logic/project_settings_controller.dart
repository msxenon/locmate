import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/constants.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_settings_controller.g.dart';

@riverpod
class ProjectSettingsController extends _$ProjectSettingsController {
  static const defaultState = LocmateSettingsState(
    projectName: 'Untitled',
    keyFormat: KeyFormat.none,
    localesOrder: [],
  );

  @override
  AsyncValue<LocmateSettingsState> build() {
    final projectResponse = ref.watch(projectManagerProvider);

    return projectResponse.when(
      data: (data) {
        switch (data) {
          case ProjectData x:
            return AsyncData(
              LocmateSettingsState(
                projectName: x.locmateSettingsModel?.projectName ?? defaultState.projectName,
                keyFormat: x.locmateSettingsModel?.keyFormat ?? defaultState.keyFormat,
                localesOrder: data.arbFileEntities.map((e) => e.locale.toLanguageTag()).toList(),
              ),
            );
          case ProjectEmpty():
            return AsyncData(defaultState);
        }
      },
      error: (e, s) => AsyncError(e, s),
      loading: () => AsyncData(defaultState),
    );
  }

  Future<void> save() async {
    await ref.read(projectRepositoryProvider).saveLocmateModel(state.value!.toModel());
    ref.invalidate(projectManagerProvider);
  }

  void saveKeyFormat(KeyFormat keyFormat) {
    state = AsyncData(state.value!.copyWith(keyFormat: keyFormat));
  }

  void saveLangsOrder(List<String> list) {
    state = AsyncData(state.value!.copyWith(localesOrder: list));
  }

  void saveProjectName(String value) {
    state = AsyncData(state.value!.copyWith(projectName: value));
  }

  void toggleLangSelection(String lang) {
    final selectedLangs = state.value!.selectedLangs;
    if (selectedLangs.contains(lang)) {
      state = AsyncData(state.value!.copyWith(selectedLangs: selectedLangs.where((e) => e != lang).toList()));
    } else {
      final newSelectedLangs = {...selectedLangs, lang};
      if (newSelectedLangs.length == state.value!.localesOrder.length) {
        // TODO: show error
        // showError('You can\'t select all languages');
        return;
      }
      state = AsyncData(state.value!.copyWith(selectedLangs: newSelectedLangs.toList()));
    }
  }

  void deleteSelectedLangs() async {
    //TODO: show warning can't undo
    final selectedLangs = state.value!.selectedLangs;
    final projectData = ref.read(projectManagerProvider).value as ProjectData?;
    if (projectData == null) {
      return;
    }
    for (final lang in selectedLangs) {
      final arbFileName = projectData.arbFileEntities.firstWhere((e) => e.locale.toLanguageTag() == lang).fileName;
      final arbFilePath = Constants.fullArbDirPath(
        projectPath: projectData.projectPath,
        arbDir: projectData.l10nYaml.arbDir,
        arbFileName: arbFileName,
      );
      await ref.read(projectDatasourceProvider).fileOp(FileOpContextDelete(path: arbFilePath));
    }

    state = AsyncData(state.value!.copyWith(
        selectedLangs: [], localesOrder: state.value!.localesOrder.where((e) => !selectedLangs.contains(e)).toList()));
    save();
  }
}

extension on LocmateSettingsState {
  LocmateSettingsModel toModel() {
    return LocmateSettingsModel(
      projectName: projectName,
      keyFormat: keyFormat,
      localesOrder: localesOrder,
    );
  }
}

import 'dart:async';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:locmate_web/src/core/constants.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:locmate_web/src/features/editor/ui/add_new_key_page_sheet.dart';
import 'package:locmate_web/src/features/languages/models/arb_items.dart';
import 'package:locmate_web/src/features/languages/models/lang_model.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/models/locale_plural_mapper.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';
import 'package:locmate_web/src/features/languages/provider/arb_parser.dart';
import 'package:locmate_web/src/features/languages/provider/icu_parser.dart';
import 'package:locmate_web/src/features/languages/provider/language_mapper.dart';
import 'package:locmate_web/src/features/languages/provider/message_format.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';
import 'package:recase/recase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'languages_controller.g.dart';

@riverpod
class LanguagesController extends _$LanguagesController {
  final _selectedKeys = <String>{};
  final _allKeys = <String>{};
  static const _focusedKeyName = 'focusedKeyName';

  Set<String> get _allReadableKeys =>
      _allKeys.whereNot((element) => element.startsWith('@')).toSet();
  String _searchKeyword = '';

  @override
  FutureOr<LangState> build() async {
    try {
      final projectState = ref.read(projectManagerProvider);

      ref.listen(projectManagerProvider, (_, next) async {
        state = AsyncData(await _buildState(next));
      });

      return _buildState(projectState);
    } catch (e, s) {
      return Future.error(e, s);
    }
  }

  Future<LangState> _buildState(
      AsyncValue<ProjectResponse> projectState) async {
    final projectData = projectState.value;
    if (projectState is AsyncData && projectData is ProjectData) {
      return _successContentHandler(projectData);
    } else if (state.value is LangState) {
      return state.value!;
    }
    return LangState(
      orderdLangs: [],
      rows: [],
      selectedKeysCount: 0,
      allKeysCount: 0,
      selectedTab: _filterTab,
      focusedKey: await _getFocusedKeyName(),
    );
  }

  void addLanguage(String locale) {
    unawaited(ref.read(projectManagerProvider.notifier).addLanguage(locale));
  }

  bool isValidKey(String value) {
    if (value.isEmpty) {
      return false;
    }
    return !_allKeys
        .any((element) => element.toLowerCase() == value.trim().toLowerCase());
  }

  void toggleCheckmark(String key) {
    if (_selectedKeys.contains(key)) {
      _selectedKeys.remove(key);
    } else {
      _selectedKeys.add(key);
    }
    ref.invalidateSelf();
  }

  Future<List<LangRowModel>> _castLangsToRows(
    ProjectData projectData,
    List<Locale> allLocales,
  ) async {
    List<LangRowModel> languages = [];
    final l10nFolderModel = projectData.arbFileEntities;
    final allKeys = l10nFolderModel.map((e) => e.values.keys).flattenedToSet;

    _allKeys.clear();
    _allKeys.addAll(allKeys);
    _selectedKeys.removeWhere((element) => !_allKeys.contains(element));
    final arbFilesContent =
        l10nFolderModel.map((e) => ArbItems.fromMap(e.values)).toList();
    final base = LanguagesMapper()(arbFilesContent);
    for (final x in base) {
      if (x.key.startsWith('@')) continue;
      final valuesMap = <Locale, dynamic>{};
      List<KeyWarning> warnings = [];
      double completionPercentage = 0;
      final step = 100 / allLocales.length;
      final formattedKey =
          _formatKey(x.key, projectData.locmateSettingsModel?.keyFormat);
      if (formattedKey != null && formattedKey != x.key) {
        warnings.add(TypeCaseKeyWarning(formattedKey));
      }
      bool isPlural = false;
      for (final locale in allLocales) {
        final valueOfThisKeyInThisLocale = x.values[locale];
        valuesMap[locale] = valueOfThisKeyInThisLocale;
        if (valueOfThisKeyInThisLocale is String &&
            valueOfThisKeyInThisLocale.contains('{')) {
          isPlural = IcuParser().parse(valueOfThisKeyInThisLocale)?.firstOrNull
              is PluralElement;
        }

        if (valueOfThisKeyInThisLocale != null &&
            valueOfThisKeyInThisLocale.toString().isNotEmpty &&
            !isPlural) {
          completionPercentage += step;
        }
      }
      if (_searchKeyword.isNotEmpty) {
        final keyIsMatched = x.key.toLowerCase().contains(_searchKeyword);
        final valueHasMatch = valuesMap.values.any((element) =>
            element.toString().toLowerCase().contains(_searchKeyword));
        if (!keyIsMatched && !valueHasMatch) {
          continue;
        }
      }
      if (isPlural) {
        final pp = <Locale, PluralValueContainer>{};
        for (final locale in allLocales) {
          final pluralCases = LocalePluralMapper()(locale.languageCode);
          final response = IcuParser().parse(valuesMap[locale] ?? '');
          final values = <PluralCase, String>{};
          for (final pluralCase in pluralCases) {
            String textValueOfThisPlural = '';
            final options = response?.elementAt(0);

            if (options is PluralElement) {
              for (final option in options.options) {
                if (option.name == pluralCase.name) {
                  for (final value in option.value) {
                    switch (value.type) {
                      case ElementType.literal:
                        textValueOfThisPlural += value.value;
                        break;
                      case ElementType.argument:
                        textValueOfThisPlural += '{${value.value}}';
                        break;
                      case ElementType.plural:
                      case ElementType.gender:
                      case ElementType.select:
                        textValueOfThisPlural += value.value;
                        break;
                    }
                  }
                }
              }
            }

            values[pluralCase] = textValueOfThisPlural;
          }
          pp[locale] = PluralValueContainer(values: values);
        }

        int notEmptyCasess = 0;
        int allPluralCases = 0;
        for (final element in pp.values) {
          notEmptyCasess +=
              element.values.values.nonNulls.where((e) => e.isNotEmpty).length;
          allPluralCases += element.values.length;
        }

        final pluralCompletionPercentage =
            (notEmptyCasess / allPluralCases) * 100;
        completionPercentage += pluralCompletionPercentage;
        languages.add(LangRowModel<PluralValueContainer>(
          key: x.key,
          isSelected: _selectedKeys.contains(x.key),
          values: pp,
          warnings: warnings.isEmpty ? null : warnings,
          completionPercentage: completionPercentage.ceil(),
          body: x.body,
          isPlural: isPlural,
        ));
      } else {
        final ss = <Locale, StringValueContainer>{};
        for (final locale in allLocales) {
          final valueOfThisKeyInThisLocale = x.values[locale];
          if (valueOfThisKeyInThisLocale is String) {
            ss[locale] =
                StringValueContainer(value: valueOfThisKeyInThisLocale);
          }
        }
        languages.add(LangRowModel<StringValueContainer>(
          key: x.key,
          isSelected: _selectedKeys.contains(x.key),
          values: ss,
          warnings: warnings.isEmpty ? null : warnings,
          completionPercentage: completionPercentage.ceil(),
          body: x.body,
          isPlural: isPlural,
        ));
      }
    }

    if (_sortType != null) {
      languages.sort((a, b) {
        switch (_sortType!) {
          case SortByKeys x:
            return x.ascending
                ? a.key.compareTo(b.key)
                : b.key.compareTo(a.key);
          case SortByValues x:
            final locale = x.locale;
            final aValue = a.values[locale];
            final bValue = b.values[locale];
            if (aValue == null && bValue == null) {
              return 0;
            }
            if (aValue == null) {
              return 1;
            }
            if (bValue == null) {
              return -1;
            }
            return _sortType!.ascending
                ? aValue.toString().compareTo(bValue.toString())
                : bValue.toString().compareTo(aValue.toString());
        }
      });
    }
    return languages;
  }

  void onSelectAll(bool? val) {
    final isSelecteAll = val ?? false;
    _selectedKeys.clear();
    if (isSelecteAll) {
      final allKeysForCurrentTab = state.value!.rows
          .where((element) {
            switch (_filterTab) {
              case MainTabs.all:
                return true;
              case MainTabs.uncompleted:
                return element.completionPercentage != 100;
              case MainTabs.warnings:
                return element.warnings != null;
              case MainTabs.selected:
                return true;
            }
          })
          .map((e) => e.key)
          .toSet();
      _selectedKeys.addAll(allKeysForCurrentTab);
    }
    ref.invalidateSelf();
  }

  SortType? _sortType;
  void sort(SortType? sortType) {
    _sortType = sortType;

    ref.invalidateSelf();
  }

  String? _formatKey(String key, KeyFormat? keyFormat) {
    if (keyFormat == null) {
      return key;
    }
    switch (keyFormat) {
      case KeyFormat.camelCase:
        return key.camelCase;
      case KeyFormat.snakeCase:
        return key.snakeCase;
      case KeyFormat.pascalCase:
        return key.pascalCase;
      case KeyFormat.none:
        return null;
    }
  }

  void search(String value) {
    _searchKeyword = value.toLowerCase();

    ref.invalidateSelf();
  }

  MainTabs _filterTab = MainTabs.all;

  void changeTab(MainTabs v) {
    _filterTab = v;
    ref.invalidateSelf();
  }

  Future<LangState> _successContentHandler(ProjectData projectData) async {
    final allLocales =
        projectData.arbFileEntities.map((e) => e.locale).toList();

    final rows = await _castLangsToRows(projectData, allLocales);

    return LangState(
      selectedTab: _filterTab,
      orderdLangs: allLocales
          .map(
            (e) => LangModel(
              locale: e,
              langCompletionPercentage: 0,
            ),
          )
          .toList(),
      rows: rows,
      selectedKeysCount: _selectedKeys.length,
      allKeysCount: _allReadableKeys.length,
      isSortAscending: _sortType?.ascending ?? false,
      sortColumnIndex: _sortType is SortByValues
          ? (_sortType as SortByValues).columnIndex
          : 0,
      focusedKey: await _getFocusedKeyName(),
    );
  }

  void setFocusedKeyName(String keyName, {bool setState = true}) {
    final validState = state.value;
    if (validState == null) return;
    final focusedKey = validState.copyWith(focusedKey: keyName);
    unawaited(ref
        .read(sharedPrefrencesWrapperProvider)
        .setString(_focusedKeyName, keyName));
    if (setState) {
      state = AsyncData(focusedKey);
    }
  }

  Future<String?> _getFocusedKeyName() async {
    final savedFocusedKey = await ref
        .read(sharedPrefrencesWrapperProvider)
        .getString(_focusedKeyName);
    if (savedFocusedKey == null) return null;
    if (!_allReadableKeys.contains(savedFocusedKey)) {
      unawaited(ref
          .read(sharedPrefrencesWrapperProvider)
          .setString(_focusedKeyName, null));
      return null;
    }
    return savedFocusedKey;
  }

  Future<void> deleteSelectedKeys() async {
    final projectState = ref.read(projectManagerProvider).value as ProjectData?;
    if (projectState == null) return;
    final arbFileEntities = projectState.arbFileEntities;
    final ops = <Future>[];
    for (final arbFileEntity in arbFileEntities) {
      final values = arbFileEntity.values;
      if (values.keys.any(_selectedKeys.contains)) {
        for (final key in _selectedKeys) {
          values.remove(key);
        }
        final fileName = arbFileEntity.fileName;
        final path = Constants.fullArbDirPath(
          projectPath: projectState.projectPath,
          arbDir: projectState.l10nYaml.arbDir,
          arbFileName: fileName,
        );
        ops.add(
          ref.read(projectRepositoryProvider).saveArbFileContent(path, values),
        );
      }
    }
    await Future.wait(ops);
    _selectedKeys.clear();
    ref.invalidate(projectManagerProvider);
  }

  Future<void> addNewKey(NewKeyData newKeyData) async {
    final projectState = ref.read(projectManagerProvider).value as ProjectData?;
    if (projectState == null) return;
    final arbFileEntities = projectState.arbFileEntities;
    final ops = <Future>[];
    for (final arbFileEntity in arbFileEntities) {
      final values = arbFileEntity.values;
      if (!values.containsKey(newKeyData.keyName)) {
        values[newKeyData.keyName] = newKeyData.isPlural
            ? _getPluralTemplate(arbFileEntity.locale.toLanguageTag())
            : '';
        values['@${newKeyData.keyName}'] =
            KeyBody(description: newKeyData.description.ifNotEmpty()).toMap();
        final fileName = arbFileEntity.fileName;
        final path = Constants.fullArbDirPath(
          projectPath: projectState.projectPath,
          arbDir: projectState.l10nYaml.arbDir,
          arbFileName: fileName,
        );
        ops.add(
          ref.read(projectRepositoryProvider).saveArbFileContent(path, values),
        );
      }
    }
    await Future.wait(ops);
    _selectedKeys.clear();
    setFocusedKeyName(newKeyData.keyName, setState: false);
    ref.invalidate(projectManagerProvider);
  }

  Future<void> saveValue(
      {required String focusedLang,
      required String key,
      required String value}) async {
    final projectState = ref.read(projectManagerProvider).value as ProjectData?;
    if (projectState == null) return;
    final arbFileEntities = projectState.arbFileEntities;
    final ops = <Future>[];

    for (final arbFileEntity in arbFileEntities) {
      if (arbFileEntity.locale.toLanguageTag() != focusedLang) continue;
      final values = arbFileEntity.values;
      values[key] = value;
      final fileName = arbFileEntity.fileName;
      final path = Constants.fullArbDirPath(
        projectPath: projectState.projectPath,
        arbDir: projectState.l10nYaml.arbDir,
        arbFileName: fileName,
      );
      ops.add(
        ref.read(projectRepositoryProvider).saveArbFileContent(path, values),
      );
    }
    await Future.wait(ops);
    ref.invalidate(projectManagerProvider);
  }

  Future<void> replaceKey(String key, String newValue) async {
    final projectState = ref.read(projectManagerProvider).value as ProjectData?;
    if (projectState == null) return;
    final arbFileEntities = projectState.arbFileEntities;
    final ops = <Future>[];
    for (final arbFileEntity in arbFileEntities) {
      final values = arbFileEntity.values;
      if (values.containsKey(key)) {
        values[newValue] = values[key];
        values.remove(key);
        final fileName = arbFileEntity.fileName;
        final path = Constants.fullArbDirPath(
          projectPath: projectState.projectPath,
          arbDir: projectState.l10nYaml.arbDir,
          arbFileName: fileName,
        );
        ops.add(
          ref.read(projectRepositoryProvider).saveArbFileContent(path, values),
        );
      }
    }
    await Future.wait(ops);
    _selectedKeys.clear();
    ref.invalidate(projectManagerProvider);
  }

  String _getPluralTemplate(String languageTag) {
    final localeToPlurals = LocalePluralMapper()(languageTag);
    final pluralValueContainer = PluralValueContainer(
      values: {
        for (final pluralCase in localeToPlurals) pluralCase: null,
      },
    );
    return pluralValueContainer.mapToStringAll();
  }
}

extension on String {
  String? ifNotEmpty() {
    if (isEmpty) {
      return null;
    }
    return this;
  }
}

sealed class SortType {
  final bool ascending;
  const SortType(this.ascending);
}

class SortByKeys extends SortType {
  const SortByKeys(super.ascending);
}

class SortByValues extends SortType {
  final Locale locale;
  final int columnIndex;
  const SortByValues(this.locale, super.ascending, this.columnIndex);
}

enum MainTabs { all, uncompleted, warnings, selected }

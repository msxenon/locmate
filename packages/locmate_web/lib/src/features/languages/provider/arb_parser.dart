import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/locale_plural_mapper.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';
import 'package:locmate_web/src/features/languages/provider/icu_parser.dart';
import 'package:locmate_web/src/features/languages/provider/message_format.dart';

class ArbParser {
  List<KeyContainer> fromMaps(List<Map<String, dynamic>> arbContents) {
    final List<KeyContainer> keyContainers = [];
    final localesAndContent = <Locale, Map<String, dynamic>>{};
    for (final arbContent in arbContents) {
      final localeValue = arbContent['@@locale'];
      if (localeValue == null) {
        continue;
      }
      final locale = Locale(localeValue);
      arbContent.remove('@@locale');
      localesAndContent[locale] = arbContent;
    }
    final allReadableKeys =
        localesAndContent.values.expand((element) => element.keys).toList().where((e) => !e.startsWith('@')).toSet();

    for (final key in allReadableKeys) {
      final keyType = getKeyValuesType(localesAndContent, key);

      keyContainers.add(keyType);
    }

    return keyContainers;
  }

  @visibleForTesting
  KeyContainer getKeyValuesType(Map<Locale, Map<String, dynamic>> localesAndContent, String key) {
    final allLocales = localesAndContent.keys;
    final allValues = Map.fromEntries(allLocales.map((e) => MapEntry<Locale, dynamic>(e, localesAndContent[e]?[key])));

    final typedBody = getKeyBody(localesAndContent, key);
    if (allValues.isEmpty) {
      return KeyContainer<StringValueContainer>(
        key: key,
        localeValueMap: {for (final locale in localesAndContent.keys) locale: StringValueContainer(value: null)},
        body: typedBody,
      );
    }

    final isAnyPlural = allValues.values.any((element) {
      if (element is! String) {
        return false;
      }
      final isPlural = IcuParser().parse(element)?.firstOrNull is PluralElement;
      return isPlural;
    });

    if (isAnyPlural) {
      return KeyContainer<PluralValueContainer>(
        key: key,
        localeValueMap: getLocalizedPluralValues(allValues),
        body: typedBody,
      );
    } else {
      return KeyContainer<StringValueContainer>(
        key: key,
        localeValueMap: {
          for (final locale in localesAndContent.keys) locale: StringValueContainer(value: allValues[locale] as String?)
        },
        body: typedBody,
      );
    }
  }

  @visibleForTesting
  KeyBody getKeyBody(Map<Locale, Map<String, dynamic>> localesAndContent, String originalKey) {
    final allBodies = localesAndContent.values
        .map((e) => e['@$originalKey'])
        .where((element) => element != null && element is Map && element.isNotEmpty);

    KeyBody? aValidKeyBody;
    for (final body in allBodies) {
      try {
        if (body == null || aValidKeyBody != null) {
          continue;
        }
        aValidKeyBody = KeyBodyMapper.fromMap(body);
      } catch (_) {}
    }
    return aValidKeyBody ?? KeyBody(description: null, placeholders: null);
  }

  @visibleForTesting
  Map<Locale, PluralValueContainer> getLocalizedPluralValues(Map<Locale, dynamic> allValues) {
    final result = <Locale, PluralValueContainer>{};
    for (final locale in allValues.keys) {
      final pluralCasesForLocale = LocalePluralMapper()(locale.languageCode);

      final response = IcuParser().parse(allValues[locale] ?? '');
      for (final pluralCase in pluralCasesForLocale) {
        String textValueOfThisPlural = '';
        final options = response?.elementAt(0);

        if (options is PluralElement) {
          for (final option in options.options) {
            //todo remove toLowerCase
            if (option.name == pluralCase.name.toLowerCase()) {
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
        final finalSting = textValueOfThisPlural.trim().isEmpty ? null : textValueOfThisPlural;

        result.update(
          locale,
          (value) => value.copyWith(values: {...value.values, pluralCase: finalSting}),
          ifAbsent: () => PluralValueContainer(values: {pluralCase: finalSting}),
        );
      }
    }
    return result;
  }

  List<Map<String, dynamic>> toMaps(List<KeyContainer> keyContainers) {
    final result = <Map<String, dynamic>>[];
    final allLocales = keyContainers.expand((element) => element.localeValueMap.keys).toSet();
    for (final locale in allLocales) {
      final localeMap = <String, dynamic>{};
      for (final keyContainer in keyContainers) {
        final value = keyContainer.localeValueMap[locale];
        bool hasValue = false;
        if (value is StringValueContainer) {
          final isValueNull = value.value == null;
          if (isValueNull) {
            continue;
          }
          hasValue = true;
          localeMap[keyContainer.key] = value.value;
        } else if (value is PluralValueContainer) {
          final pluralValues = value.mapToString();
          if (pluralValues == null) {
            continue;
          }
          hasValue = true;
          localeMap[keyContainer.key] = pluralValues;
        }
        if (hasValue) {
          localeMap['@${keyContainer.key}'] = keyContainer.body.toMap();
        }
      }
      localeMap['@@locale'] = locale.toLanguageTag();

      result.add(localeMap);
    }
    return result;
  }

  String pluralPhrase(PluralCase pluralCase, String? value) {
    return "${pluralCase.name}{${value ?? ''}}";
  }
}

extension PluralValueContainerX on PluralValueContainer {
  String? mapToString() {
    final pluralValues = <String>[];
    final isAllNull = values.values.every((element) => element == null);
    if (isAllNull) {
      return null;
    }
    for (final key in values.keys) {
      final valueForThisPlural = values[key];

      pluralValues.add(_pluralPhrase(key, valueForThisPlural));
    }
    return "{count, plural, ${pluralValues.join(' ')}}";
  }

  String mapToStringAll() {
    final pluralValues = <String>[];

    for (final key in values.keys) {
      final valueForThisPlural = values[key];

      pluralValues.add(_pluralPhrase(key, valueForThisPlural));
    }
    return "{count, plural, ${pluralValues.join(' ')}}";
  }

  String _pluralPhrase(PluralCase pluralCase, String? value) {
    return "${pluralCase.name}{${value ?? ''}}";
  }
}

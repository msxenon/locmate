import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';
part 'lang_row_model.mapper.dart';

@MappableClass(ignoreNull: true)
class LangRowModel<T extends ValueContainer> with LangRowModelMappable<T> {
  final String key;
  final Map<Locale, T> values;
  final bool isSelected;
  final List<KeyWarning>? warnings;
  final int completionPercentage;
  final KeyBody body;
  final bool isPlural;
  LangRowModel({
    required this.key,
    required this.isSelected,
    required this.values,
    required this.body,
    required this.warnings,
    required this.completionPercentage,
    required this.isPlural,
  });
}

@MappableClass(ignoreNull: true)
sealed class ValueContainer with ValueContainerMappable {
  const ValueContainer();
}

@MappableClass(ignoreNull: true)
class StringValueContainer extends ValueContainer
    with StringValueContainerMappable {
  final String? value;
  StringValueContainer({required this.value});
}

@MappableClass(ignoreNull: true)
class PluralValueContainer extends ValueContainer
    with PluralValueContainerMappable {
  final Map<PluralCase, String?> values;
  PluralValueContainer({required this.values});
}

@MappableClass(ignoreNull: true)
class LangRowModelBase with LangRowModelBaseMappable {
  final String key;
  final Map<Locale, String> values;

  final KeyBody body;
  LangRowModelBase({
    required this.key,
    required this.values,
    required this.body,
  });
}

@MappableClass(ignoreNull: true)
class KeyContainer<T extends ValueContainer> with KeyContainerMappable<T> {
  final String key;
  final Map<Locale, T> localeValueMap;
  final KeyBody body;
  KeyContainer({
    required this.key,
    required this.localeValueMap,
    required this.body,
  });
}

@MappableClass(ignoreNull: true, hook: KeyBodyHook())
class KeyBody with KeyBodyMappable {
  final String? description;
  final List<KeyPlaceholder>? placeholders;

  KeyBody({required this.description, this.placeholders});
}

class KeyBodyHook extends MappingHook {
  const KeyBodyHook();

  @override
  Object? beforeDecode(Object? value) {
    if (value is Map<String, dynamic>) {
      final placeholdersMap = value['placeholders'];
      if (placeholdersMap != null) {
        final placeholders = value['placeholders'] as Map?;
        final fixedMap = Map<String, dynamic>.from(value);
        fixedMap['placeholders'] = [
          for (final entry
              in placeholders?.entries ?? <MapEntry<String, dynamic>>[])
            <String, dynamic>{'key': entry.key, ...entry.value},
        ];
        return fixedMap;
      }
    }

    return value;
  }

  @override
  Object? beforeEncode(Object? value) {
    if (value is KeyBody) {
      final placeholders = value.placeholders;

      return {
        if (value.description != null) 'description': value.description,
        if (placeholders != null)
          'placeholders': {
            for (final placeholder in placeholders)
              placeholder.key: {
                if (placeholder.type != null) 'type': placeholder.type,
              },
          },
      };
    }

    return value;
  }
}

@MappableClass(ignoreNull: true)
class KeyPlaceholder with KeyPlaceholderMappable {
  final String key;
  final String? type;
  KeyPlaceholder({required this.key, this.type});
}

extension LangRowModelExtension on LangRowModel {
  String readValue(Locale locale) {
    return getValue(locale) ?? '';
  }

  String? getValue(Locale locale) {
    final value = values[locale];
    String? result;
    switch (value) {
      case StringValueContainer():
        result = value.value;
      case PluralValueContainer():
        return null;
      default:
        return null;
    }
    return result is String && result.isNotEmpty ? result : null;
  }
}

extension StringExtension on String {
  TextDirection textDirection() {
    return intl.Bidi.estimateDirectionOfText(this) == intl.TextDirection.RTL
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  String get capitalizeFirst {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

sealed class KeyWarning {
  const KeyWarning();
}

class MissingValue extends KeyWarning {
  const MissingValue();
}

class MissingValueWarning extends KeyWarning {
  const MissingValueWarning();
}

class DuplicateKeyWarning extends KeyWarning {
  const DuplicateKeyWarning();
}

class TypeCaseKeyWarning extends KeyWarning {
  final String suggestedValue;
  TypeCaseKeyWarning(this.suggestedValue);
}

// class Rows {
//   final List<LangRowModel> rows;
//   Rows(this.rows);
// }

// class RowContainer<T extends ValueContainer> {
//   final Map<Locale, T> values;
//   RowContainer(this.values);
// }

// sealed class ValueContainer {}

// class StringValueContainer extends ValueContainer {
//   final String value;
//   StringValueContainer(this.value);
// }

// class PluralValueContainer extends ValueContainer {
//   final Map<PluralCase, String> values;
//   PluralValueContainer(this.values);
// }

import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';

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

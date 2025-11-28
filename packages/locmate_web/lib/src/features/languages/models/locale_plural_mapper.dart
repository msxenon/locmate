import 'package:locmate_web/src/features/languages/models/plural_rules.dart';

class LocalePluralMapper {
  /// Detects available plural categories dynamically based on CLDR rules
  List<PluralCase> call(String locale) {
    // Common numbers used to trigger plural cases across languages
    List<num> testNumbers = [0, 1, 2, 3, 5, 11, 100, 5000];

    // Stores detected plural categories
    final Set<PluralCase> pluralCases = {};

    for (final num in testNumbers) {
      if (num == 0) {
        pluralCases.add(PluralCase.zero);
        continue;
      }

      pluralCases.add(PluralRuleMapper().call(num, locale));
    }

    // Ensure "other" is always present
    pluralCases.add(PluralCase.other);

    return pluralCases.toList()..sort((a, b) => a.index.compareTo(b.index));
  }
}

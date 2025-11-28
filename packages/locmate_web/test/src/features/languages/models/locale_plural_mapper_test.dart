import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/features/languages/models/locale_plural_mapper.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';

void main() {
  test('test locale plurals mapper', () {
    final enTemplate = LocalePluralMapper()('en');
    final ruTemplate = LocalePluralMapper()('ru');
    final arTemplate = LocalePluralMapper()('ar');
    final be = LocalePluralMapper()('be');
    expect(enTemplate, [PluralCase.zero, PluralCase.one, PluralCase.other]);
    expect(ruTemplate, [PluralCase.zero, PluralCase.one, PluralCase.few, PluralCase.many, PluralCase.other]);
    expect(arTemplate, [
      PluralCase.zero,
      PluralCase.one,
      PluralCase.two,
      PluralCase.few,
      PluralCase.many,
      PluralCase.other,
    ]);
    expect(be, [PluralCase.zero, PluralCase.one, PluralCase.few, PluralCase.many, PluralCase.other]);
  });
}

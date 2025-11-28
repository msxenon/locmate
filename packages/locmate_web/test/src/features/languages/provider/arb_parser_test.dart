import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/plural_rules.dart';
import 'package:locmate_web/src/features/languages/provider/arb_parser.dart';

void main() {
  test('arb parser fromMaps', () {
    final arbContent1 = {
      "@@locale": "en",
      "key2": "Key2Valuen",
      "key1": "jnj\n",
      "key123": "",
      "key122": "",
      "key441": "{shiftName} shift will start in {duration}",
      "@key441": {
        "description": "Desc",
        "placeholders": {
          "duration": {"type": "String"},
          "shiftName": {"type": "String"}
        }
      },
      "companiesPlural": "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
      "@companiesPlural": {}
    };

    final arbContent2 = {
      "@@locale": "en_US",
      "key1": "Key1Value",
      "key123": "",
      "key122": "",
      "key441": "",
      "@key441": {}
    };

    final arbContent3 = {"@@locale": "ar"};

    final parser = ArbParser().fromMaps([arbContent1, arbContent2, arbContent3]);

    expect(parser, [
      KeyContainer<StringValueContainer>(
        key: 'key2',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: 'Key2Valuen'),
          Locale('en_US'): StringValueContainer(value: null),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(description: null, placeholders: null),
      ),
      KeyContainer<StringValueContainer>(
        key: 'key1',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: 'jnj\n'),
          Locale('en_US'): StringValueContainer(value: 'Key1Value'),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(description: null, placeholders: null),
      ),
      KeyContainer<StringValueContainer>(
        key: 'key123',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: ''),
          Locale('en_US'): StringValueContainer(value: ''),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(description: null, placeholders: null),
      ),
      KeyContainer<StringValueContainer>(
        key: 'key122',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: ''),
          Locale('en_US'): StringValueContainer(value: ''),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(description: null, placeholders: null),
      ),
      KeyContainer<StringValueContainer>(
        key: 'key441',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: '{shiftName} shift will start in {duration}'),
          Locale('en_US'): StringValueContainer(value: ''),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(
          description: 'Desc',
          placeholders: [
            KeyPlaceholder(key: 'duration', type: 'String'),
            KeyPlaceholder(key: 'shiftName', type: 'String'),
          ],
        ),
      ),
      KeyContainer<PluralValueContainer>(
        key: 'companiesPlural',
        localeValueMap: {
          Locale('en'): PluralValueContainer(values: {
            PluralCase.zero: 'No Companies, Yet!',
            PluralCase.one: 'One company',
            PluralCase.other: '{count} companies',
          }),
          Locale('en_US'): PluralValueContainer(values: {
            PluralCase.zero: null,
            PluralCase.one: null,
            PluralCase.other: null,
          }),
          Locale('ar'): PluralValueContainer(values: {
            PluralCase.zero: null,
            PluralCase.one: null,
            PluralCase.two: null,
            PluralCase.few: null,
            PluralCase.many: null,
            PluralCase.other: null,
          }),
        },
        body: KeyBody(description: null, placeholders: null),
      ),
    ]);
  });

  test('toMaps', () {
    final toMap = ArbParser().toMaps([
      KeyContainer<StringValueContainer>(
        key: 'key441',
        localeValueMap: {
          Locale('en'): StringValueContainer(value: '{shiftName} shift will start in {duration}'),
          Locale('en_US'): StringValueContainer(value: ''),
          Locale('ar'): StringValueContainer(value: null),
        },
        body: KeyBody(
          description: 'Desc',
          placeholders: [
            KeyPlaceholder(key: 'duration', type: 'String'),
            KeyPlaceholder(key: 'shiftName', type: 'String'),
          ],
        ),
      ),
      KeyContainer<PluralValueContainer>(
        key: 'companiesPlural',
        localeValueMap: {
          Locale('en'): PluralValueContainer(values: {
            PluralCase.zero: 'No Companies, Yet!',
            PluralCase.one: 'One company',
            PluralCase.other: '{count} companies',
          }),
          Locale('en_US'): PluralValueContainer(values: {
            PluralCase.zero: null,
            PluralCase.one: null,
            PluralCase.other: null,
          }),
          Locale('ar'): PluralValueContainer(values: {
            PluralCase.zero: null,
            PluralCase.one: null,
            PluralCase.two: null,
            PluralCase.few: null,
            PluralCase.many: null,
            PluralCase.other: null,
          }),
        },
        body: KeyBody(description: null, placeholders: null),
      )
    ]);

    expect(toMap, [
      {
        '@@locale': 'en',
        "companiesPlural": "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
        "@companiesPlural": {},
        "key441": "{shiftName} shift will start in {duration}",
        "@key441": {
          "description": "Desc",
          "placeholders": {
            "duration": {"type": "String"},
            "shiftName": {"type": "String"}
          },
        },
      },
      {
        '@@locale': 'en_US',
        "key441": "",
        "@key441": {
          "description": "Desc",
          "placeholders": {
            "duration": {"type": "String"},
            "shiftName": {"type": "String"}
          }
        },
      },
      {
        '@@locale': 'ar',
      }
    ]);
  });

  group('getKeyBody', () {
    test('arb parser ...', () {
      final arbContent1 = {
        "@@locale": "en",
        "key2": "Key2Valuen",
        "key1": "jnj\n",
        "key123": "",
        "key122": "",
        "key441": "{shiftName} shift will start in {duration}",
        "@key441": {
          "description": "Desc",
          "placeholders": {
            "duration": {"type": "String"},
            "shiftName": {"type": "String"}
          }
        },
        "companiesPlural": "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
        "@companiesPlural": {}
      };

      final arbContent2 = {
        "@@locale": "en_US",
        "key1": "Key1Value",
        "key123": "",
        "key122": "",
        "key441": "",
        "@key441": {}
      };

      final arbContent3 = {"@@locale": "ar"};

      expect(
        ArbParser().getKeyBody({
          Locale('en'): arbContent1,
          Locale('en_US'): arbContent2,
          Locale('ar'): arbContent3,
        }, 'key1'),
        KeyBody(description: null, placeholders: null),
      );

      expect(
        ArbParser().getKeyBody({
          Locale('en'): arbContent1,
          Locale('en_US'): arbContent2,
          Locale('ar'): arbContent3,
        }, 'key441'),
        KeyBody(
          description: 'Desc',
          placeholders: [
            KeyPlaceholder(key: 'duration', type: 'String'),
            KeyPlaceholder(key: 'shiftName', type: 'String'),
          ],
        ),
      );
    });
  });

  group('getKeyValuesType', () {
    test('should return StringValueContainer', () {
      final localesAndContent = {
        Locale('en'): {
          "key1": "Key1Value",
        },
        Locale('en_US'): {
          "key1": "Key1Value",
        },
        Locale('ar'): {
          "key1": "Key1Value",
        },
      };

      final keyType = ArbParser().getKeyValuesType(localesAndContent, 'key1');

      expect(
        keyType,
        KeyContainer<StringValueContainer>(
          body: KeyBody(description: null, placeholders: null),
          key: 'key1',
          localeValueMap: {
            Locale('en'): StringValueContainer(value: 'Key1Value'),
            Locale('en_US'): StringValueContainer(value: 'Key1Value'),
            Locale('ar'): StringValueContainer(value: 'Key1Value')
          },
        ),
      );
    });

    test('should return PluralValueContainer', () {
      final localesAndContent = {
        Locale('en'): {
          "key1": "Key1Value",
        },
        Locale('en_US'): {
          "key1": "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
        },
        Locale('ar'): {
          "key1": "Key1Value",
        },
      };

      final keyType = ArbParser().getKeyValuesType(localesAndContent, 'key1');

      expect(
        keyType,
        KeyContainer<PluralValueContainer>(
          body: KeyBody(description: null, placeholders: null),
          key: 'key1',
          localeValueMap: {
            Locale('en'): PluralValueContainer(
              values: {
                PluralCase.zero: null,
                PluralCase.one: null,
                PluralCase.other: null,
              },
            ),
            Locale('en_US'): PluralValueContainer(
              values: {
                PluralCase.zero: 'No Companies, Yet!',
                PluralCase.one: 'One company',
                PluralCase.other: '{count} companies',
              },
            ),
            Locale('ar'): PluralValueContainer(
              values: {
                PluralCase.zero: null,
                PluralCase.one: null,
                PluralCase.two: null,
                PluralCase.few: null,
                PluralCase.many: null,
                PluralCase.other: null,
              },
            ),
          },
        ),
      );
    });
  });

  group('getLocalizedPluralValues', () {
    test('if it has one locale with value', () {
      final localesAndContent = {
        Locale('en'): null,
        Locale('en_US'): "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
        Locale('ar'): null,
      };

      final keyType = ArbParser().getLocalizedPluralValues(localesAndContent);

      expect(
        keyType,
        <Locale, PluralValueContainer>{
          Locale('en'): PluralValueContainer(
            values: {
              PluralCase.zero: null,
              PluralCase.one: null,
              PluralCase.other: null,
            },
          ),
          Locale('en_US'): PluralValueContainer(
            values: {
              PluralCase.zero: 'No Companies, Yet!',
              PluralCase.one: 'One company',
              PluralCase.other: '{count} companies',
            },
          ),
          Locale('ar'): PluralValueContainer(
            values: {
              PluralCase.zero: null,
              PluralCase.one: null,
              PluralCase.two: null,
              PluralCase.few: null,
              PluralCase.many: null,
              PluralCase.other: null,
            },
          ),
        },
      );
    });

    test('if it has two locales with values', () {
      final localesAndContent = {
        Locale('en'): null,
        Locale('en_US'): "{count, plural, zero{No Companies, Yet!} one{One company} other{{count} companies}}",
        Locale('ar'):
            "{count, plural, zero{No Companies, Yet!} one{One company} two{Two companies} few{Few companies} many{Many companies} other{{count} companies}}",
      };

      final keyType = ArbParser().getLocalizedPluralValues(localesAndContent);

      expect(
        keyType,
        <Locale, PluralValueContainer>{
          Locale('en'): PluralValueContainer(
            values: {
              PluralCase.zero: null,
              PluralCase.one: null,
              PluralCase.other: null,
            },
          ),
          Locale('en_US'): PluralValueContainer(
            values: {
              PluralCase.zero: 'No Companies, Yet!',
              PluralCase.one: 'One company',
              PluralCase.other: '{count} companies',
            },
          ),
          Locale('ar'): PluralValueContainer(
            values: {
              PluralCase.zero: 'No Companies, Yet!',
              PluralCase.one: 'One company',
              PluralCase.two: 'Two companies',
              PluralCase.few: 'Few companies',
              PluralCase.many: 'Many companies',
              PluralCase.other: '{count} companies',
            },
          ),
        },
      );
    });
  });
}

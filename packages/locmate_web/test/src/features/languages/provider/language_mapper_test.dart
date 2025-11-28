import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/features/languages/models/arb_items.dart';
import 'package:locmate_web/src/features/languages/provider/language_mapper.dart';

void main() {
  test('should not add any key if it does not have @@locale', () {
    final x = LanguagesMapper().call([
      ArbItems(items: [KeyValueItem(key: 'key', value: 'value')])
    ]);
    expect(x.length, 0);
  });

  test('should add only arb keys that have @@locale', () {
    final x = LanguagesMapper().call(
      [
        ArbItems(
          items: [
            KeyValueItem(key: 'key', value: 'value'),
            KeyValueItem(key: '@@locale', value: 'en'),
          ],
        ),
        ArbItems(
          items: [
            KeyValueItem(key: 'key2', value: 'value2'),
          ],
        )
      ],
    );
    expect(x.length, 1);
  });

  test('should add only arb keys that have @@locale', () {
    final x = LanguagesMapper().call(
      [
        ArbItems(
          items: [
            KeyValueItem(key: 'key', value: 'value'),
            KeyValueItem(key: '@@locale', value: 'en'),
          ],
        ),
        ArbItems(
          items: [
            KeyValueItem(key: 'key2', value: 'value2'),
            KeyValueItem(key: 'key2', value: 'value2'),
            KeyValueItem(key: '@@locale', value: 'en'),
          ],
        )
      ],
    );
    expect(x.length, 2);
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/features/languages/models/arb_items.dart';

void main() {
  test('arb serialization test', () {
    final arbContent = {
      "@@locale": "en",
      "key2": "Key2ValuEn",
      "@key2": {"description": "Key2 description"},
      "key1": "jnj\n",
      "key3": "",
      "key4": "",
      "@key4": {},
      "key5": "{shiftName} shift will start in {duration}",
      "@key5": {
        "placeholders": {
          "duration": {"type": "String"},
          "shiftName": {"type": "String"}
        }
      }
    };
    final arbItems = ArbItems.fromMap(arbContent);

    expect(arbItems.items.length, 9);
    expect(arbItems.items[0], KeyValueItem(key: "@@locale", value: "en"));
    expect(arbItems.items[1], KeyValueItem(key: "key2", value: "Key2ValuEn"));
    expect(arbItems.items[2], KeyBodyItem(key: "@key2", description: "Key2 description"));
    expect(arbItems.items[3], KeyValueItem(key: "key1", value: "jnj\n"));
    expect(arbItems.items[4], KeyValueItem(key: "key3", value: ""));
    expect(arbItems.items[5], KeyValueItem(key: "key4", value: ""));
    expect(arbItems.items[6], KeyBodyItem(key: "@key4"));

    expect(
      arbItems.items[7],
      KeyValueItem(
        key: "key5",
        value: "{shiftName} shift will start in {duration}",
      ),
    );
    expect(
      arbItems.items[8],
      KeyBodyItem(
        key: "@key5",
        placeholders: [
          KeyBodyPlaceholder(key: "duration", type: "String"),
          KeyBodyPlaceholder(key: "shiftName", type: "String")
        ],
      ),
    );

    expect(arbItems, ArbItems.fromMap(arbContent));

    expect(arbItems.toMap(), arbContent);
  });
}

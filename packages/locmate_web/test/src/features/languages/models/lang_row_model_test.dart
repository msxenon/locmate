import 'package:flutter_test/flutter_test.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';

void main() {
  test('$KeyBody serialization complete sample', () {
    const bodyMap = {
      "description": "Desc",
      "placeholders": {
        "duration": {"type": "String"},
        "shiftName": {"type": "String"},
      },
    };
    final body = KeyBodyMapper.fromMap(bodyMap);
    expect(
      body,
      KeyBody(
        description: 'Desc',
        placeholders: [
          KeyPlaceholder(key: 'duration', type: 'String'),
          KeyPlaceholder(key: 'shiftName', type: 'String'),
        ],
      ),
    );
    expect(body.toMap(), bodyMap);
  });

  test('$KeyBody without description', () {
    const bodyMap = {
      "placeholders": {
        "duration": {"type": "String"},
      },
    };
    final body = KeyBodyMapper.fromMap(bodyMap);
    expect(
      body,
      KeyBody(
        description: null,
        placeholders: [KeyPlaceholder(key: 'duration', type: 'String')],
      ),
    );
    expect(body.toMap(), bodyMap);
  });

  test('$KeyBody empty placeholders', () {
    const bodyMap = {"description": "Desc", "placeholders": {}};
    final body = KeyBodyMapper.fromMap(bodyMap);
    expect(body, KeyBody(description: 'Desc', placeholders: []));

    expect(body.toMap(), bodyMap);
  });

  test('$KeyBody no placeholders', () {
    const bodyMap = {"description": "Desc"};
    final body = KeyBodyMapper.fromMap(bodyMap);
    expect(body, KeyBody(description: 'Desc', placeholders: null));

    expect(body.toMap(), bodyMap);
  });

  test('$KeyBody empty body', () {
    const bodyMap = <String, dynamic>{};
    final body = KeyBodyMapper.fromMap(bodyMap);
    expect(body, KeyBody(description: null, placeholders: null));

    expect(body.toMap(), bodyMap);
  });
}

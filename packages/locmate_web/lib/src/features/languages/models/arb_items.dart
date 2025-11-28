import 'package:dart_mappable/dart_mappable.dart';
part 'arb_items.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.equals | GenerateMethods.copy | GenerateMethods.stringify)
class ArbItems with ArbItemsMappable {
  final List<KeyItem> items;
  ArbItems({required this.items});

  static ArbItems fromMap(Map<String, dynamic> map) {
    final items = map.entries.map((e) {
      if (e.value is String) {
        return KeyValueItem(key: e.key, value: e.value);
      } else {
        final placeHoldersMap = e.value['placeholders'] as Map<String, dynamic>?;
        final placeholders = placeHoldersMap?.entries.map((e) {
          return KeyBodyPlaceholder(key: e.key, type: e.value['type']);
        }).toList();
        return KeyBodyItem(key: e.key, description: e.value['description'], placeholders: placeholders);
      }
    }).toList();
    return ArbItems(items: items);
  }
}

@MappableClass(generateMethods: GenerateMethods.equals | GenerateMethods.copy | GenerateMethods.stringify)
sealed class KeyItem with KeyItemMappable {
  final String key;
  KeyItem({
    required this.key,
  });
}

@MappableClass(generateMethods: GenerateMethods.equals | GenerateMethods.copy | GenerateMethods.stringify)
class KeyValueItem extends KeyItem with KeyValueItemMappable {
  final String value;
  KeyValueItem({
    required super.key,
    required this.value,
  });
}

@MappableClass(generateMethods: GenerateMethods.equals | GenerateMethods.copy | GenerateMethods.stringify)
class KeyBodyItem extends KeyItem with KeyBodyItemMappable {
  final String? description;
  final List<KeyBodyPlaceholder>? placeholders;
  KeyBodyItem({
    required super.key,
    this.description,
    this.placeholders,
  });
}

@MappableClass(generateMethods: GenerateMethods.equals | GenerateMethods.copy | GenerateMethods.stringify)
class KeyBodyPlaceholder with KeyBodyPlaceholderMappable {
  final String key;
  final String? type;
  KeyBodyPlaceholder({
    required this.key,
    this.type,
  });
}

extension ArbItemsExtension on ArbItems {
  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    for (final item in items) {
      if (item is KeyValueItem) {
        result[item.key] = item.value;
      } else if (item is KeyBodyItem) {
        final description = item.description;
        result[item.key] = {
          if (description != null) 'description': description,
          if (item.placeholders != null)
            'placeholders': {
              for (final placeholder in item.placeholders!) placeholder.key: {'type': placeholder.type}
            }
        };
      }
    }
    return result;
  }
}

extension KeyBodyItemX on KeyBodyItem {
  String get originalKey => key.replaceFirst('@', '');
}

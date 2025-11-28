// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'arb_items.dart';

class ArbItemsMapper extends ClassMapperBase<ArbItems> {
  ArbItemsMapper._();

  static ArbItemsMapper? _instance;
  static ArbItemsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbItemsMapper._());
      KeyItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ArbItems';

  static List<KeyItem> _$items(ArbItems v) => v.items;
  static const Field<ArbItems, List<KeyItem>> _f$items =
      Field('items', _$items);

  @override
  final MappableFields<ArbItems> fields = const {
    #items: _f$items,
  };

  static ArbItems _instantiate(DecodingData data) {
    return ArbItems(items: data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin ArbItemsMappable {
  ArbItemsCopyWith<ArbItems, ArbItems, ArbItems> get copyWith =>
      _ArbItemsCopyWithImpl<ArbItems, ArbItems>(
          this as ArbItems, $identity, $identity);
  @override
  String toString() {
    return ArbItemsMapper.ensureInitialized().stringifyValue(this as ArbItems);
  }

  @override
  bool operator ==(Object other) {
    return ArbItemsMapper.ensureInitialized()
        .equalsValue(this as ArbItems, other);
  }

  @override
  int get hashCode {
    return ArbItemsMapper.ensureInitialized().hashValue(this as ArbItems);
  }
}

extension ArbItemsValueCopy<$R, $Out> on ObjectCopyWith<$R, ArbItems, $Out> {
  ArbItemsCopyWith<$R, ArbItems, $Out> get $asArbItems =>
      $base.as((v, t, t2) => _ArbItemsCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbItemsCopyWith<$R, $In extends ArbItems, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, KeyItem, KeyItemCopyWith<$R, KeyItem, KeyItem>> get items;
  $R call({List<KeyItem>? items});
  ArbItemsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArbItemsCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbItems, $Out>
    implements ArbItemsCopyWith<$R, ArbItems, $Out> {
  _ArbItemsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbItems> $mapper =
      ArbItemsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, KeyItem, KeyItemCopyWith<$R, KeyItem, KeyItem>> get items =>
      ListCopyWith(
          $value.items, (v, t) => v.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({List<KeyItem>? items}) =>
      $apply(FieldCopyWithData({if (items != null) #items: items}));
  @override
  ArbItems $make(CopyWithData data) =>
      ArbItems(items: data.get(#items, or: $value.items));

  @override
  ArbItemsCopyWith<$R2, ArbItems, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ArbItemsCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KeyItemMapper extends ClassMapperBase<KeyItem> {
  KeyItemMapper._();

  static KeyItemMapper? _instance;
  static KeyItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyItemMapper._());
      KeyValueItemMapper.ensureInitialized();
      KeyBodyItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KeyItem';

  static String _$key(KeyItem v) => v.key;
  static const Field<KeyItem, String> _f$key = Field('key', _$key);

  @override
  final MappableFields<KeyItem> fields = const {
    #key: _f$key,
  };

  static KeyItem _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('KeyItem');
  }

  @override
  final Function instantiate = _instantiate;
}

mixin KeyItemMappable {
  KeyItemCopyWith<KeyItem, KeyItem, KeyItem> get copyWith;
}

abstract class KeyItemCopyWith<$R, $In extends KeyItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? key});
  KeyItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class KeyValueItemMapper extends ClassMapperBase<KeyValueItem> {
  KeyValueItemMapper._();

  static KeyValueItemMapper? _instance;
  static KeyValueItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyValueItemMapper._());
      KeyItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KeyValueItem';

  static String _$key(KeyValueItem v) => v.key;
  static const Field<KeyValueItem, String> _f$key = Field('key', _$key);
  static String _$value(KeyValueItem v) => v.value;
  static const Field<KeyValueItem, String> _f$value = Field('value', _$value);

  @override
  final MappableFields<KeyValueItem> fields = const {
    #key: _f$key,
    #value: _f$value,
  };

  static KeyValueItem _instantiate(DecodingData data) {
    return KeyValueItem(key: data.dec(_f$key), value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin KeyValueItemMappable {
  KeyValueItemCopyWith<KeyValueItem, KeyValueItem, KeyValueItem> get copyWith =>
      _KeyValueItemCopyWithImpl<KeyValueItem, KeyValueItem>(
          this as KeyValueItem, $identity, $identity);
  @override
  String toString() {
    return KeyValueItemMapper.ensureInitialized()
        .stringifyValue(this as KeyValueItem);
  }

  @override
  bool operator ==(Object other) {
    return KeyValueItemMapper.ensureInitialized()
        .equalsValue(this as KeyValueItem, other);
  }

  @override
  int get hashCode {
    return KeyValueItemMapper.ensureInitialized()
        .hashValue(this as KeyValueItem);
  }
}

extension KeyValueItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KeyValueItem, $Out> {
  KeyValueItemCopyWith<$R, KeyValueItem, $Out> get $asKeyValueItem =>
      $base.as((v, t, t2) => _KeyValueItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KeyValueItemCopyWith<$R, $In extends KeyValueItem, $Out>
    implements KeyItemCopyWith<$R, $In, $Out> {
  @override
  $R call({String? key, String? value});
  KeyValueItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _KeyValueItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KeyValueItem, $Out>
    implements KeyValueItemCopyWith<$R, KeyValueItem, $Out> {
  _KeyValueItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyValueItem> $mapper =
      KeyValueItemMapper.ensureInitialized();
  @override
  $R call({String? key, String? value}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (value != null) #value: value}));
  @override
  KeyValueItem $make(CopyWithData data) => KeyValueItem(
      key: data.get(#key, or: $value.key),
      value: data.get(#value, or: $value.value));

  @override
  KeyValueItemCopyWith<$R2, KeyValueItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KeyValueItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KeyBodyItemMapper extends ClassMapperBase<KeyBodyItem> {
  KeyBodyItemMapper._();

  static KeyBodyItemMapper? _instance;
  static KeyBodyItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyBodyItemMapper._());
      KeyItemMapper.ensureInitialized();
      KeyBodyPlaceholderMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KeyBodyItem';

  static String _$key(KeyBodyItem v) => v.key;
  static const Field<KeyBodyItem, String> _f$key = Field('key', _$key);
  static String? _$description(KeyBodyItem v) => v.description;
  static const Field<KeyBodyItem, String> _f$description =
      Field('description', _$description, opt: true);
  static List<KeyBodyPlaceholder>? _$placeholders(KeyBodyItem v) =>
      v.placeholders;
  static const Field<KeyBodyItem, List<KeyBodyPlaceholder>> _f$placeholders =
      Field('placeholders', _$placeholders, opt: true);

  @override
  final MappableFields<KeyBodyItem> fields = const {
    #key: _f$key,
    #description: _f$description,
    #placeholders: _f$placeholders,
  };

  static KeyBodyItem _instantiate(DecodingData data) {
    return KeyBodyItem(
        key: data.dec(_f$key),
        description: data.dec(_f$description),
        placeholders: data.dec(_f$placeholders));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin KeyBodyItemMappable {
  KeyBodyItemCopyWith<KeyBodyItem, KeyBodyItem, KeyBodyItem> get copyWith =>
      _KeyBodyItemCopyWithImpl<KeyBodyItem, KeyBodyItem>(
          this as KeyBodyItem, $identity, $identity);
  @override
  String toString() {
    return KeyBodyItemMapper.ensureInitialized()
        .stringifyValue(this as KeyBodyItem);
  }

  @override
  bool operator ==(Object other) {
    return KeyBodyItemMapper.ensureInitialized()
        .equalsValue(this as KeyBodyItem, other);
  }

  @override
  int get hashCode {
    return KeyBodyItemMapper.ensureInitialized().hashValue(this as KeyBodyItem);
  }
}

extension KeyBodyItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KeyBodyItem, $Out> {
  KeyBodyItemCopyWith<$R, KeyBodyItem, $Out> get $asKeyBodyItem =>
      $base.as((v, t, t2) => _KeyBodyItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KeyBodyItemCopyWith<$R, $In extends KeyBodyItem, $Out>
    implements KeyItemCopyWith<$R, $In, $Out> {
  ListCopyWith<
      $R,
      KeyBodyPlaceholder,
      KeyBodyPlaceholderCopyWith<$R, KeyBodyPlaceholder,
          KeyBodyPlaceholder>>? get placeholders;
  @override
  $R call(
      {String? key,
      String? description,
      List<KeyBodyPlaceholder>? placeholders});
  KeyBodyItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _KeyBodyItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KeyBodyItem, $Out>
    implements KeyBodyItemCopyWith<$R, KeyBodyItem, $Out> {
  _KeyBodyItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyBodyItem> $mapper =
      KeyBodyItemMapper.ensureInitialized();
  @override
  ListCopyWith<
      $R,
      KeyBodyPlaceholder,
      KeyBodyPlaceholderCopyWith<$R, KeyBodyPlaceholder,
          KeyBodyPlaceholder>>? get placeholders => $value.placeholders != null
      ? ListCopyWith($value.placeholders!, (v, t) => v.copyWith.$chain(t),
          (v) => call(placeholders: v))
      : null;
  @override
  $R call(
          {String? key,
          Object? description = $none,
          Object? placeholders = $none}) =>
      $apply(FieldCopyWithData({
        if (key != null) #key: key,
        if (description != $none) #description: description,
        if (placeholders != $none) #placeholders: placeholders
      }));
  @override
  KeyBodyItem $make(CopyWithData data) => KeyBodyItem(
      key: data.get(#key, or: $value.key),
      description: data.get(#description, or: $value.description),
      placeholders: data.get(#placeholders, or: $value.placeholders));

  @override
  KeyBodyItemCopyWith<$R2, KeyBodyItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KeyBodyItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KeyBodyPlaceholderMapper extends ClassMapperBase<KeyBodyPlaceholder> {
  KeyBodyPlaceholderMapper._();

  static KeyBodyPlaceholderMapper? _instance;
  static KeyBodyPlaceholderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyBodyPlaceholderMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'KeyBodyPlaceholder';

  static String _$key(KeyBodyPlaceholder v) => v.key;
  static const Field<KeyBodyPlaceholder, String> _f$key = Field('key', _$key);
  static String? _$type(KeyBodyPlaceholder v) => v.type;
  static const Field<KeyBodyPlaceholder, String> _f$type =
      Field('type', _$type, opt: true);

  @override
  final MappableFields<KeyBodyPlaceholder> fields = const {
    #key: _f$key,
    #type: _f$type,
  };

  static KeyBodyPlaceholder _instantiate(DecodingData data) {
    return KeyBodyPlaceholder(key: data.dec(_f$key), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;
}

mixin KeyBodyPlaceholderMappable {
  KeyBodyPlaceholderCopyWith<KeyBodyPlaceholder, KeyBodyPlaceholder,
          KeyBodyPlaceholder>
      get copyWith => _KeyBodyPlaceholderCopyWithImpl<KeyBodyPlaceholder,
          KeyBodyPlaceholder>(this as KeyBodyPlaceholder, $identity, $identity);
  @override
  String toString() {
    return KeyBodyPlaceholderMapper.ensureInitialized()
        .stringifyValue(this as KeyBodyPlaceholder);
  }

  @override
  bool operator ==(Object other) {
    return KeyBodyPlaceholderMapper.ensureInitialized()
        .equalsValue(this as KeyBodyPlaceholder, other);
  }

  @override
  int get hashCode {
    return KeyBodyPlaceholderMapper.ensureInitialized()
        .hashValue(this as KeyBodyPlaceholder);
  }
}

extension KeyBodyPlaceholderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KeyBodyPlaceholder, $Out> {
  KeyBodyPlaceholderCopyWith<$R, KeyBodyPlaceholder, $Out>
      get $asKeyBodyPlaceholder => $base.as(
          (v, t, t2) => _KeyBodyPlaceholderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KeyBodyPlaceholderCopyWith<$R, $In extends KeyBodyPlaceholder,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? key, String? type});
  KeyBodyPlaceholderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KeyBodyPlaceholderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KeyBodyPlaceholder, $Out>
    implements KeyBodyPlaceholderCopyWith<$R, KeyBodyPlaceholder, $Out> {
  _KeyBodyPlaceholderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyBodyPlaceholder> $mapper =
      KeyBodyPlaceholderMapper.ensureInitialized();
  @override
  $R call({String? key, Object? type = $none}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (type != $none) #type: type}));
  @override
  KeyBodyPlaceholder $make(CopyWithData data) => KeyBodyPlaceholder(
      key: data.get(#key, or: $value.key),
      type: data.get(#type, or: $value.type));

  @override
  KeyBodyPlaceholderCopyWith<$R2, KeyBodyPlaceholder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KeyBodyPlaceholderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

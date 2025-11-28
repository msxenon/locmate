// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lang_row_model.dart';

class LangRowModelMapper extends ClassMapperBase<LangRowModel> {
  LangRowModelMapper._();

  static LangRowModelMapper? _instance;
  static LangRowModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LangRowModelMapper._());
      KeyBodyMapper.ensureInitialized();
      ValueContainerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LangRowModel';
  @override
  Function get typeFactory =>
      <T extends ValueContainer>(f) => f<LangRowModel<T>>();

  static String _$key(LangRowModel v) => v.key;
  static const Field<LangRowModel, String> _f$key = Field('key', _$key);
  static bool _$isSelected(LangRowModel v) => v.isSelected;
  static const Field<LangRowModel, bool> _f$isSelected =
      Field('isSelected', _$isSelected);
  static Map<Locale, ValueContainer> _$values(LangRowModel v) => v.values;
  static dynamic _arg$values<T extends ValueContainer>(f) =>
      f<Map<Locale, T>>();
  static const Field<LangRowModel, Map<Locale, ValueContainer>> _f$values =
      Field('values', _$values, arg: _arg$values);
  static KeyBody _$body(LangRowModel v) => v.body;
  static const Field<LangRowModel, KeyBody> _f$body = Field('body', _$body);
  static List<KeyWarning>? _$warnings(LangRowModel v) => v.warnings;
  static const Field<LangRowModel, List<KeyWarning>> _f$warnings =
      Field('warnings', _$warnings);
  static int _$completionPercentage(LangRowModel v) => v.completionPercentage;
  static const Field<LangRowModel, int> _f$completionPercentage =
      Field('completionPercentage', _$completionPercentage);
  static bool _$isPlural(LangRowModel v) => v.isPlural;
  static const Field<LangRowModel, bool> _f$isPlural =
      Field('isPlural', _$isPlural);

  @override
  final MappableFields<LangRowModel> fields = const {
    #key: _f$key,
    #isSelected: _f$isSelected,
    #values: _f$values,
    #body: _f$body,
    #warnings: _f$warnings,
    #completionPercentage: _f$completionPercentage,
    #isPlural: _f$isPlural,
  };
  @override
  final bool ignoreNull = true;

  static LangRowModel<T> _instantiate<T extends ValueContainer>(
      DecodingData data) {
    return LangRowModel(
        key: data.dec(_f$key),
        isSelected: data.dec(_f$isSelected),
        values: data.dec(_f$values),
        body: data.dec(_f$body),
        warnings: data.dec(_f$warnings),
        completionPercentage: data.dec(_f$completionPercentage),
        isPlural: data.dec(_f$isPlural));
  }

  @override
  final Function instantiate = _instantiate;

  static LangRowModel<T> fromMap<T extends ValueContainer>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LangRowModel<T>>(map);
  }

  static LangRowModel<T> fromJson<T extends ValueContainer>(String json) {
    return ensureInitialized().decodeJson<LangRowModel<T>>(json);
  }
}

mixin LangRowModelMappable<T extends ValueContainer> {
  String toJson() {
    return LangRowModelMapper.ensureInitialized()
        .encodeJson<LangRowModel<T>>(this as LangRowModel<T>);
  }

  Map<String, dynamic> toMap() {
    return LangRowModelMapper.ensureInitialized()
        .encodeMap<LangRowModel<T>>(this as LangRowModel<T>);
  }

  LangRowModelCopyWith<LangRowModel<T>, LangRowModel<T>, LangRowModel<T>, T>
      get copyWith =>
          _LangRowModelCopyWithImpl<LangRowModel<T>, LangRowModel<T>, T>(
              this as LangRowModel<T>, $identity, $identity);
  @override
  String toString() {
    return LangRowModelMapper.ensureInitialized()
        .stringifyValue(this as LangRowModel<T>);
  }

  @override
  bool operator ==(Object other) {
    return LangRowModelMapper.ensureInitialized()
        .equalsValue(this as LangRowModel<T>, other);
  }

  @override
  int get hashCode {
    return LangRowModelMapper.ensureInitialized()
        .hashValue(this as LangRowModel<T>);
  }
}

extension LangRowModelValueCopy<$R, $Out, T extends ValueContainer>
    on ObjectCopyWith<$R, LangRowModel<T>, $Out> {
  LangRowModelCopyWith<$R, LangRowModel<T>, $Out, T> get $asLangRowModel =>
      $base.as((v, t, t2) => _LangRowModelCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class LangRowModelCopyWith<$R, $In extends LangRowModel<T>, $Out,
    T extends ValueContainer> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, Locale, T, ValueContainerCopyWith<$R, T, T>> get values;
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body;
  ListCopyWith<$R, KeyWarning, ObjectCopyWith<$R, KeyWarning, KeyWarning>>?
      get warnings;
  $R call(
      {String? key,
      bool? isSelected,
      Map<Locale, T>? values,
      KeyBody? body,
      List<KeyWarning>? warnings,
      int? completionPercentage,
      bool? isPlural});
  LangRowModelCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LangRowModelCopyWithImpl<$R, $Out, T extends ValueContainer>
    extends ClassCopyWithBase<$R, LangRowModel<T>, $Out>
    implements LangRowModelCopyWith<$R, LangRowModel<T>, $Out, T> {
  _LangRowModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LangRowModel> $mapper =
      LangRowModelMapper.ensureInitialized();
  @override
  MapCopyWith<$R, Locale, T, ValueContainerCopyWith<$R, T, T>> get values =>
      MapCopyWith(
          $value.values,
          (v, t) => (v.copyWith as ValueContainerCopyWith<ValueContainer, T, T>)
              .$chain(t),
          (v) => call(values: v));
  @override
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body =>
      $value.body.copyWith.$chain((v) => call(body: v));
  @override
  ListCopyWith<$R, KeyWarning, ObjectCopyWith<$R, KeyWarning, KeyWarning>>?
      get warnings => $value.warnings != null
          ? ListCopyWith(
              $value.warnings!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(warnings: v))
          : null;
  @override
  $R call(
          {String? key,
          bool? isSelected,
          Map<Locale, T>? values,
          KeyBody? body,
          Object? warnings = $none,
          int? completionPercentage,
          bool? isPlural}) =>
      $apply(FieldCopyWithData({
        if (key != null) #key: key,
        if (isSelected != null) #isSelected: isSelected,
        if (values != null) #values: values,
        if (body != null) #body: body,
        if (warnings != $none) #warnings: warnings,
        if (completionPercentage != null)
          #completionPercentage: completionPercentage,
        if (isPlural != null) #isPlural: isPlural
      }));
  @override
  LangRowModel<T> $make(CopyWithData data) => LangRowModel(
      key: data.get(#key, or: $value.key),
      isSelected: data.get(#isSelected, or: $value.isSelected),
      values: data.get(#values, or: $value.values),
      body: data.get(#body, or: $value.body),
      warnings: data.get(#warnings, or: $value.warnings),
      completionPercentage:
          data.get(#completionPercentage, or: $value.completionPercentage),
      isPlural: data.get(#isPlural, or: $value.isPlural));

  @override
  LangRowModelCopyWith<$R2, LangRowModel<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LangRowModelCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

class KeyBodyMapper extends ClassMapperBase<KeyBody> {
  KeyBodyMapper._();

  static KeyBodyMapper? _instance;
  static KeyBodyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyBodyMapper._());
      KeyPlaceholderMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KeyBody';

  static String? _$description(KeyBody v) => v.description;
  static const Field<KeyBody, String> _f$description =
      Field('description', _$description);
  static List<KeyPlaceholder>? _$placeholders(KeyBody v) => v.placeholders;
  static const Field<KeyBody, List<KeyPlaceholder>> _f$placeholders =
      Field('placeholders', _$placeholders, opt: true);

  @override
  final MappableFields<KeyBody> fields = const {
    #description: _f$description,
    #placeholders: _f$placeholders,
  };
  @override
  final bool ignoreNull = true;

  @override
  final MappingHook hook = const KeyBodyHook();
  static KeyBody _instantiate(DecodingData data) {
    return KeyBody(
        description: data.dec(_f$description),
        placeholders: data.dec(_f$placeholders));
  }

  @override
  final Function instantiate = _instantiate;

  static KeyBody fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KeyBody>(map);
  }

  static KeyBody fromJson(String json) {
    return ensureInitialized().decodeJson<KeyBody>(json);
  }
}

mixin KeyBodyMappable {
  String toJson() {
    return KeyBodyMapper.ensureInitialized()
        .encodeJson<KeyBody>(this as KeyBody);
  }

  Map<String, dynamic> toMap() {
    return KeyBodyMapper.ensureInitialized()
        .encodeMap<KeyBody>(this as KeyBody);
  }

  KeyBodyCopyWith<KeyBody, KeyBody, KeyBody> get copyWith =>
      _KeyBodyCopyWithImpl<KeyBody, KeyBody>(
          this as KeyBody, $identity, $identity);
  @override
  String toString() {
    return KeyBodyMapper.ensureInitialized().stringifyValue(this as KeyBody);
  }

  @override
  bool operator ==(Object other) {
    return KeyBodyMapper.ensureInitialized()
        .equalsValue(this as KeyBody, other);
  }

  @override
  int get hashCode {
    return KeyBodyMapper.ensureInitialized().hashValue(this as KeyBody);
  }
}

extension KeyBodyValueCopy<$R, $Out> on ObjectCopyWith<$R, KeyBody, $Out> {
  KeyBodyCopyWith<$R, KeyBody, $Out> get $asKeyBody =>
      $base.as((v, t, t2) => _KeyBodyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KeyBodyCopyWith<$R, $In extends KeyBody, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, KeyPlaceholder,
          KeyPlaceholderCopyWith<$R, KeyPlaceholder, KeyPlaceholder>>?
      get placeholders;
  $R call({String? description, List<KeyPlaceholder>? placeholders});
  KeyBodyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _KeyBodyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KeyBody, $Out>
    implements KeyBodyCopyWith<$R, KeyBody, $Out> {
  _KeyBodyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyBody> $mapper =
      KeyBodyMapper.ensureInitialized();
  @override
  ListCopyWith<$R, KeyPlaceholder,
          KeyPlaceholderCopyWith<$R, KeyPlaceholder, KeyPlaceholder>>?
      get placeholders => $value.placeholders != null
          ? ListCopyWith($value.placeholders!, (v, t) => v.copyWith.$chain(t),
              (v) => call(placeholders: v))
          : null;
  @override
  $R call({Object? description = $none, Object? placeholders = $none}) =>
      $apply(FieldCopyWithData({
        if (description != $none) #description: description,
        if (placeholders != $none) #placeholders: placeholders
      }));
  @override
  KeyBody $make(CopyWithData data) => KeyBody(
      description: data.get(#description, or: $value.description),
      placeholders: data.get(#placeholders, or: $value.placeholders));

  @override
  KeyBodyCopyWith<$R2, KeyBody, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _KeyBodyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KeyPlaceholderMapper extends ClassMapperBase<KeyPlaceholder> {
  KeyPlaceholderMapper._();

  static KeyPlaceholderMapper? _instance;
  static KeyPlaceholderMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyPlaceholderMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'KeyPlaceholder';

  static String _$key(KeyPlaceholder v) => v.key;
  static const Field<KeyPlaceholder, String> _f$key = Field('key', _$key);
  static String? _$type(KeyPlaceholder v) => v.type;
  static const Field<KeyPlaceholder, String> _f$type =
      Field('type', _$type, opt: true);

  @override
  final MappableFields<KeyPlaceholder> fields = const {
    #key: _f$key,
    #type: _f$type,
  };
  @override
  final bool ignoreNull = true;

  static KeyPlaceholder _instantiate(DecodingData data) {
    return KeyPlaceholder(key: data.dec(_f$key), type: data.dec(_f$type));
  }

  @override
  final Function instantiate = _instantiate;

  static KeyPlaceholder fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KeyPlaceholder>(map);
  }

  static KeyPlaceholder fromJson(String json) {
    return ensureInitialized().decodeJson<KeyPlaceholder>(json);
  }
}

mixin KeyPlaceholderMappable {
  String toJson() {
    return KeyPlaceholderMapper.ensureInitialized()
        .encodeJson<KeyPlaceholder>(this as KeyPlaceholder);
  }

  Map<String, dynamic> toMap() {
    return KeyPlaceholderMapper.ensureInitialized()
        .encodeMap<KeyPlaceholder>(this as KeyPlaceholder);
  }

  KeyPlaceholderCopyWith<KeyPlaceholder, KeyPlaceholder, KeyPlaceholder>
      get copyWith =>
          _KeyPlaceholderCopyWithImpl<KeyPlaceholder, KeyPlaceholder>(
              this as KeyPlaceholder, $identity, $identity);
  @override
  String toString() {
    return KeyPlaceholderMapper.ensureInitialized()
        .stringifyValue(this as KeyPlaceholder);
  }

  @override
  bool operator ==(Object other) {
    return KeyPlaceholderMapper.ensureInitialized()
        .equalsValue(this as KeyPlaceholder, other);
  }

  @override
  int get hashCode {
    return KeyPlaceholderMapper.ensureInitialized()
        .hashValue(this as KeyPlaceholder);
  }
}

extension KeyPlaceholderValueCopy<$R, $Out>
    on ObjectCopyWith<$R, KeyPlaceholder, $Out> {
  KeyPlaceholderCopyWith<$R, KeyPlaceholder, $Out> get $asKeyPlaceholder =>
      $base.as((v, t, t2) => _KeyPlaceholderCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class KeyPlaceholderCopyWith<$R, $In extends KeyPlaceholder, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? key, String? type});
  KeyPlaceholderCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KeyPlaceholderCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, KeyPlaceholder, $Out>
    implements KeyPlaceholderCopyWith<$R, KeyPlaceholder, $Out> {
  _KeyPlaceholderCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyPlaceholder> $mapper =
      KeyPlaceholderMapper.ensureInitialized();
  @override
  $R call({String? key, Object? type = $none}) => $apply(FieldCopyWithData(
      {if (key != null) #key: key, if (type != $none) #type: type}));
  @override
  KeyPlaceholder $make(CopyWithData data) => KeyPlaceholder(
      key: data.get(#key, or: $value.key),
      type: data.get(#type, or: $value.type));

  @override
  KeyPlaceholderCopyWith<$R2, KeyPlaceholder, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KeyPlaceholderCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ValueContainerMapper extends ClassMapperBase<ValueContainer> {
  ValueContainerMapper._();

  static ValueContainerMapper? _instance;
  static ValueContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ValueContainerMapper._());
      StringValueContainerMapper.ensureInitialized();
      PluralValueContainerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ValueContainer';

  @override
  final MappableFields<ValueContainer> fields = const {};
  @override
  final bool ignoreNull = true;

  static ValueContainer _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('ValueContainer');
  }

  @override
  final Function instantiate = _instantiate;

  static ValueContainer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ValueContainer>(map);
  }

  static ValueContainer fromJson(String json) {
    return ensureInitialized().decodeJson<ValueContainer>(json);
  }
}

mixin ValueContainerMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ValueContainerCopyWith<ValueContainer, ValueContainer, ValueContainer>
      get copyWith;
}

abstract class ValueContainerCopyWith<$R, $In extends ValueContainer, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  ValueContainerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class StringValueContainerMapper extends ClassMapperBase<StringValueContainer> {
  StringValueContainerMapper._();

  static StringValueContainerMapper? _instance;
  static StringValueContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StringValueContainerMapper._());
      ValueContainerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'StringValueContainer';

  static String? _$value(StringValueContainer v) => v.value;
  static const Field<StringValueContainer, String> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<StringValueContainer> fields = const {
    #value: _f$value,
  };
  @override
  final bool ignoreNull = true;

  static StringValueContainer _instantiate(DecodingData data) {
    return StringValueContainer(value: data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static StringValueContainer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StringValueContainer>(map);
  }

  static StringValueContainer fromJson(String json) {
    return ensureInitialized().decodeJson<StringValueContainer>(json);
  }
}

mixin StringValueContainerMappable {
  String toJson() {
    return StringValueContainerMapper.ensureInitialized()
        .encodeJson<StringValueContainer>(this as StringValueContainer);
  }

  Map<String, dynamic> toMap() {
    return StringValueContainerMapper.ensureInitialized()
        .encodeMap<StringValueContainer>(this as StringValueContainer);
  }

  StringValueContainerCopyWith<StringValueContainer, StringValueContainer,
      StringValueContainer> get copyWith => _StringValueContainerCopyWithImpl<
          StringValueContainer, StringValueContainer>(
      this as StringValueContainer, $identity, $identity);
  @override
  String toString() {
    return StringValueContainerMapper.ensureInitialized()
        .stringifyValue(this as StringValueContainer);
  }

  @override
  bool operator ==(Object other) {
    return StringValueContainerMapper.ensureInitialized()
        .equalsValue(this as StringValueContainer, other);
  }

  @override
  int get hashCode {
    return StringValueContainerMapper.ensureInitialized()
        .hashValue(this as StringValueContainer);
  }
}

extension StringValueContainerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StringValueContainer, $Out> {
  StringValueContainerCopyWith<$R, StringValueContainer, $Out>
      get $asStringValueContainer => $base.as(
          (v, t, t2) => _StringValueContainerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StringValueContainerCopyWith<
    $R,
    $In extends StringValueContainer,
    $Out> implements ValueContainerCopyWith<$R, $In, $Out> {
  @override
  $R call({String? value});
  StringValueContainerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StringValueContainerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StringValueContainer, $Out>
    implements StringValueContainerCopyWith<$R, StringValueContainer, $Out> {
  _StringValueContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StringValueContainer> $mapper =
      StringValueContainerMapper.ensureInitialized();
  @override
  $R call({Object? value = $none}) =>
      $apply(FieldCopyWithData({if (value != $none) #value: value}));
  @override
  StringValueContainer $make(CopyWithData data) =>
      StringValueContainer(value: data.get(#value, or: $value.value));

  @override
  StringValueContainerCopyWith<$R2, StringValueContainer, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _StringValueContainerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class PluralValueContainerMapper extends ClassMapperBase<PluralValueContainer> {
  PluralValueContainerMapper._();

  static PluralValueContainerMapper? _instance;
  static PluralValueContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PluralValueContainerMapper._());
      ValueContainerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PluralValueContainer';

  static Map<PluralCase, String?> _$values(PluralValueContainer v) => v.values;
  static const Field<PluralValueContainer, Map<PluralCase, String?>> _f$values =
      Field('values', _$values);

  @override
  final MappableFields<PluralValueContainer> fields = const {
    #values: _f$values,
  };
  @override
  final bool ignoreNull = true;

  static PluralValueContainer _instantiate(DecodingData data) {
    return PluralValueContainer(values: data.dec(_f$values));
  }

  @override
  final Function instantiate = _instantiate;

  static PluralValueContainer fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PluralValueContainer>(map);
  }

  static PluralValueContainer fromJson(String json) {
    return ensureInitialized().decodeJson<PluralValueContainer>(json);
  }
}

mixin PluralValueContainerMappable {
  String toJson() {
    return PluralValueContainerMapper.ensureInitialized()
        .encodeJson<PluralValueContainer>(this as PluralValueContainer);
  }

  Map<String, dynamic> toMap() {
    return PluralValueContainerMapper.ensureInitialized()
        .encodeMap<PluralValueContainer>(this as PluralValueContainer);
  }

  PluralValueContainerCopyWith<PluralValueContainer, PluralValueContainer,
      PluralValueContainer> get copyWith => _PluralValueContainerCopyWithImpl<
          PluralValueContainer, PluralValueContainer>(
      this as PluralValueContainer, $identity, $identity);
  @override
  String toString() {
    return PluralValueContainerMapper.ensureInitialized()
        .stringifyValue(this as PluralValueContainer);
  }

  @override
  bool operator ==(Object other) {
    return PluralValueContainerMapper.ensureInitialized()
        .equalsValue(this as PluralValueContainer, other);
  }

  @override
  int get hashCode {
    return PluralValueContainerMapper.ensureInitialized()
        .hashValue(this as PluralValueContainer);
  }
}

extension PluralValueContainerValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PluralValueContainer, $Out> {
  PluralValueContainerCopyWith<$R, PluralValueContainer, $Out>
      get $asPluralValueContainer => $base.as(
          (v, t, t2) => _PluralValueContainerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PluralValueContainerCopyWith<
    $R,
    $In extends PluralValueContainer,
    $Out> implements ValueContainerCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, PluralCase, String?, ObjectCopyWith<$R, String?, String?>?>
      get values;
  @override
  $R call({Map<PluralCase, String?>? values});
  PluralValueContainerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PluralValueContainerCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PluralValueContainer, $Out>
    implements PluralValueContainerCopyWith<$R, PluralValueContainer, $Out> {
  _PluralValueContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PluralValueContainer> $mapper =
      PluralValueContainerMapper.ensureInitialized();
  @override
  MapCopyWith<$R, PluralCase, String?, ObjectCopyWith<$R, String?, String?>?>
      get values => MapCopyWith($value.values,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v));
  @override
  $R call({Map<PluralCase, String?>? values}) =>
      $apply(FieldCopyWithData({if (values != null) #values: values}));
  @override
  PluralValueContainer $make(CopyWithData data) =>
      PluralValueContainer(values: data.get(#values, or: $value.values));

  @override
  PluralValueContainerCopyWith<$R2, PluralValueContainer, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _PluralValueContainerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LangRowModelBaseMapper extends ClassMapperBase<LangRowModelBase> {
  LangRowModelBaseMapper._();

  static LangRowModelBaseMapper? _instance;
  static LangRowModelBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LangRowModelBaseMapper._());
      KeyBodyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LangRowModelBase';

  static String _$key(LangRowModelBase v) => v.key;
  static const Field<LangRowModelBase, String> _f$key = Field('key', _$key);
  static Map<Locale, String> _$values(LangRowModelBase v) => v.values;
  static const Field<LangRowModelBase, Map<Locale, String>> _f$values =
      Field('values', _$values);
  static KeyBody _$body(LangRowModelBase v) => v.body;
  static const Field<LangRowModelBase, KeyBody> _f$body = Field('body', _$body);

  @override
  final MappableFields<LangRowModelBase> fields = const {
    #key: _f$key,
    #values: _f$values,
    #body: _f$body,
  };
  @override
  final bool ignoreNull = true;

  static LangRowModelBase _instantiate(DecodingData data) {
    return LangRowModelBase(
        key: data.dec(_f$key),
        values: data.dec(_f$values),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static LangRowModelBase fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LangRowModelBase>(map);
  }

  static LangRowModelBase fromJson(String json) {
    return ensureInitialized().decodeJson<LangRowModelBase>(json);
  }
}

mixin LangRowModelBaseMappable {
  String toJson() {
    return LangRowModelBaseMapper.ensureInitialized()
        .encodeJson<LangRowModelBase>(this as LangRowModelBase);
  }

  Map<String, dynamic> toMap() {
    return LangRowModelBaseMapper.ensureInitialized()
        .encodeMap<LangRowModelBase>(this as LangRowModelBase);
  }

  LangRowModelBaseCopyWith<LangRowModelBase, LangRowModelBase, LangRowModelBase>
      get copyWith =>
          _LangRowModelBaseCopyWithImpl<LangRowModelBase, LangRowModelBase>(
              this as LangRowModelBase, $identity, $identity);
  @override
  String toString() {
    return LangRowModelBaseMapper.ensureInitialized()
        .stringifyValue(this as LangRowModelBase);
  }

  @override
  bool operator ==(Object other) {
    return LangRowModelBaseMapper.ensureInitialized()
        .equalsValue(this as LangRowModelBase, other);
  }

  @override
  int get hashCode {
    return LangRowModelBaseMapper.ensureInitialized()
        .hashValue(this as LangRowModelBase);
  }
}

extension LangRowModelBaseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LangRowModelBase, $Out> {
  LangRowModelBaseCopyWith<$R, LangRowModelBase, $Out>
      get $asLangRowModelBase => $base
          .as((v, t, t2) => _LangRowModelBaseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LangRowModelBaseCopyWith<$R, $In extends LangRowModelBase, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, Locale, String, ObjectCopyWith<$R, String, String>>
      get values;
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body;
  $R call({String? key, Map<Locale, String>? values, KeyBody? body});
  LangRowModelBaseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LangRowModelBaseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LangRowModelBase, $Out>
    implements LangRowModelBaseCopyWith<$R, LangRowModelBase, $Out> {
  _LangRowModelBaseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LangRowModelBase> $mapper =
      LangRowModelBaseMapper.ensureInitialized();
  @override
  MapCopyWith<$R, Locale, String, ObjectCopyWith<$R, String, String>>
      get values => MapCopyWith($value.values,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v));
  @override
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body =>
      $value.body.copyWith.$chain((v) => call(body: v));
  @override
  $R call({String? key, Map<Locale, String>? values, KeyBody? body}) =>
      $apply(FieldCopyWithData({
        if (key != null) #key: key,
        if (values != null) #values: values,
        if (body != null) #body: body
      }));
  @override
  LangRowModelBase $make(CopyWithData data) => LangRowModelBase(
      key: data.get(#key, or: $value.key),
      values: data.get(#values, or: $value.values),
      body: data.get(#body, or: $value.body));

  @override
  LangRowModelBaseCopyWith<$R2, LangRowModelBase, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LangRowModelBaseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class KeyContainerMapper extends ClassMapperBase<KeyContainer> {
  KeyContainerMapper._();

  static KeyContainerMapper? _instance;
  static KeyContainerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = KeyContainerMapper._());
      KeyBodyMapper.ensureInitialized();
      ValueContainerMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'KeyContainer';
  @override
  Function get typeFactory =>
      <T extends ValueContainer>(f) => f<KeyContainer<T>>();

  static String _$key(KeyContainer v) => v.key;
  static const Field<KeyContainer, String> _f$key = Field('key', _$key);
  static Map<Locale, ValueContainer> _$localeValueMap(KeyContainer v) =>
      v.localeValueMap;
  static dynamic _arg$localeValueMap<T extends ValueContainer>(f) =>
      f<Map<Locale, T>>();
  static const Field<KeyContainer, Map<Locale, ValueContainer>>
      _f$localeValueMap =
      Field('localeValueMap', _$localeValueMap, arg: _arg$localeValueMap);
  static KeyBody _$body(KeyContainer v) => v.body;
  static const Field<KeyContainer, KeyBody> _f$body = Field('body', _$body);

  @override
  final MappableFields<KeyContainer> fields = const {
    #key: _f$key,
    #localeValueMap: _f$localeValueMap,
    #body: _f$body,
  };
  @override
  final bool ignoreNull = true;

  static KeyContainer<T> _instantiate<T extends ValueContainer>(
      DecodingData data) {
    return KeyContainer(
        key: data.dec(_f$key),
        localeValueMap: data.dec(_f$localeValueMap),
        body: data.dec(_f$body));
  }

  @override
  final Function instantiate = _instantiate;

  static KeyContainer<T> fromMap<T extends ValueContainer>(
      Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<KeyContainer<T>>(map);
  }

  static KeyContainer<T> fromJson<T extends ValueContainer>(String json) {
    return ensureInitialized().decodeJson<KeyContainer<T>>(json);
  }
}

mixin KeyContainerMappable<T extends ValueContainer> {
  String toJson() {
    return KeyContainerMapper.ensureInitialized()
        .encodeJson<KeyContainer<T>>(this as KeyContainer<T>);
  }

  Map<String, dynamic> toMap() {
    return KeyContainerMapper.ensureInitialized()
        .encodeMap<KeyContainer<T>>(this as KeyContainer<T>);
  }

  KeyContainerCopyWith<KeyContainer<T>, KeyContainer<T>, KeyContainer<T>, T>
      get copyWith =>
          _KeyContainerCopyWithImpl<KeyContainer<T>, KeyContainer<T>, T>(
              this as KeyContainer<T>, $identity, $identity);
  @override
  String toString() {
    return KeyContainerMapper.ensureInitialized()
        .stringifyValue(this as KeyContainer<T>);
  }

  @override
  bool operator ==(Object other) {
    return KeyContainerMapper.ensureInitialized()
        .equalsValue(this as KeyContainer<T>, other);
  }

  @override
  int get hashCode {
    return KeyContainerMapper.ensureInitialized()
        .hashValue(this as KeyContainer<T>);
  }
}

extension KeyContainerValueCopy<$R, $Out, T extends ValueContainer>
    on ObjectCopyWith<$R, KeyContainer<T>, $Out> {
  KeyContainerCopyWith<$R, KeyContainer<T>, $Out, T> get $asKeyContainer =>
      $base.as((v, t, t2) => _KeyContainerCopyWithImpl<$R, $Out, T>(v, t, t2));
}

abstract class KeyContainerCopyWith<$R, $In extends KeyContainer<T>, $Out,
    T extends ValueContainer> implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, Locale, T, ValueContainerCopyWith<$R, T, T>>
      get localeValueMap;
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body;
  $R call({String? key, Map<Locale, T>? localeValueMap, KeyBody? body});
  KeyContainerCopyWith<$R2, $In, $Out2, T> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _KeyContainerCopyWithImpl<$R, $Out, T extends ValueContainer>
    extends ClassCopyWithBase<$R, KeyContainer<T>, $Out>
    implements KeyContainerCopyWith<$R, KeyContainer<T>, $Out, T> {
  _KeyContainerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<KeyContainer> $mapper =
      KeyContainerMapper.ensureInitialized();
  @override
  MapCopyWith<$R, Locale, T, ValueContainerCopyWith<$R, T, T>>
      get localeValueMap => MapCopyWith(
          $value.localeValueMap,
          (v, t) => (v.copyWith as ValueContainerCopyWith<ValueContainer, T, T>)
              .$chain(t),
          (v) => call(localeValueMap: v));
  @override
  KeyBodyCopyWith<$R, KeyBody, KeyBody> get body =>
      $value.body.copyWith.$chain((v) => call(body: v));
  @override
  $R call({String? key, Map<Locale, T>? localeValueMap, KeyBody? body}) =>
      $apply(FieldCopyWithData({
        if (key != null) #key: key,
        if (localeValueMap != null) #localeValueMap: localeValueMap,
        if (body != null) #body: body
      }));
  @override
  KeyContainer<T> $make(CopyWithData data) => KeyContainer(
      key: data.get(#key, or: $value.key),
      localeValueMap: data.get(#localeValueMap, or: $value.localeValueMap),
      body: data.get(#body, or: $value.body));

  @override
  KeyContainerCopyWith<$R2, KeyContainer<T>, $Out2, T> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _KeyContainerCopyWithImpl<$R2, $Out2, T>($value, $cast, t);
}

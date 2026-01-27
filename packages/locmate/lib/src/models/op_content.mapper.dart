// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'op_content.dart';

class OpContentMapper extends ClassMapperBase<OpContent> {
  OpContentMapper._();

  static OpContentMapper? _instance;
  static OpContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OpContentMapper._());
      StringOpContentMapper.ensureInitialized();
      MapOpContentMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OpContent';

  @override
  final MappableFields<OpContent> fields = const {};

  static OpContent _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'OpContent', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static OpContent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpContent>(map);
  }

  static OpContent fromJson(String json) {
    return ensureInitialized().decodeJson<OpContent>(json);
  }
}

mixin OpContentMappable {
  String toJson();
  Map<String, dynamic> toMap();
  OpContentCopyWith<OpContent, OpContent, OpContent> get copyWith;
}

abstract class OpContentCopyWith<$R, $In extends OpContent, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  OpContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class StringOpContentMapper extends SubClassMapperBase<StringOpContent> {
  StringOpContentMapper._();

  static StringOpContentMapper? _instance;
  static StringOpContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StringOpContentMapper._());
      OpContentMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'StringOpContent';

  static String _$value(StringOpContent v) => v.value;
  static const Field<StringOpContent, String> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<StringOpContent> fields = const {
    #value: _f$value,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'string';
  @override
  late final ClassMapperBase superMapper = OpContentMapper.ensureInitialized();

  static StringOpContent _instantiate(DecodingData data) {
    return StringOpContent(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static StringOpContent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StringOpContent>(map);
  }

  static StringOpContent fromJson(String json) {
    return ensureInitialized().decodeJson<StringOpContent>(json);
  }
}

mixin StringOpContentMappable {
  String toJson() {
    return StringOpContentMapper.ensureInitialized()
        .encodeJson<StringOpContent>(this as StringOpContent);
  }

  Map<String, dynamic> toMap() {
    return StringOpContentMapper.ensureInitialized()
        .encodeMap<StringOpContent>(this as StringOpContent);
  }

  StringOpContentCopyWith<StringOpContent, StringOpContent, StringOpContent>
      get copyWith =>
          _StringOpContentCopyWithImpl<StringOpContent, StringOpContent>(
              this as StringOpContent, $identity, $identity);
  @override
  String toString() {
    return StringOpContentMapper.ensureInitialized()
        .stringifyValue(this as StringOpContent);
  }

  @override
  bool operator ==(Object other) {
    return StringOpContentMapper.ensureInitialized()
        .equalsValue(this as StringOpContent, other);
  }

  @override
  int get hashCode {
    return StringOpContentMapper.ensureInitialized()
        .hashValue(this as StringOpContent);
  }
}

extension StringOpContentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StringOpContent, $Out> {
  StringOpContentCopyWith<$R, StringOpContent, $Out> get $asStringOpContent =>
      $base.as((v, t, t2) => _StringOpContentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StringOpContentCopyWith<$R, $In extends StringOpContent, $Out>
    implements OpContentCopyWith<$R, $In, $Out> {
  @override
  $R call({String? value});
  StringOpContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StringOpContentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StringOpContent, $Out>
    implements StringOpContentCopyWith<$R, StringOpContent, $Out> {
  _StringOpContentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StringOpContent> $mapper =
      StringOpContentMapper.ensureInitialized();
  @override
  $R call({String? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  StringOpContent $make(CopyWithData data) =>
      StringOpContent(data.get(#value, or: $value.value));

  @override
  StringOpContentCopyWith<$R2, StringOpContent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StringOpContentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class MapOpContentMapper extends SubClassMapperBase<MapOpContent> {
  MapOpContentMapper._();

  static MapOpContentMapper? _instance;
  static MapOpContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = MapOpContentMapper._());
      OpContentMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'MapOpContent';

  static Map<String, dynamic> _$value(MapOpContent v) => v.value;
  static const Field<MapOpContent, Map<String, dynamic>> _f$value =
      Field('value', _$value);

  @override
  final MappableFields<MapOpContent> fields = const {
    #value: _f$value,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'map';
  @override
  late final ClassMapperBase superMapper = OpContentMapper.ensureInitialized();

  static MapOpContent _instantiate(DecodingData data) {
    return MapOpContent(data.dec(_f$value));
  }

  @override
  final Function instantiate = _instantiate;

  static MapOpContent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<MapOpContent>(map);
  }

  static MapOpContent fromJson(String json) {
    return ensureInitialized().decodeJson<MapOpContent>(json);
  }
}

mixin MapOpContentMappable {
  String toJson() {
    return MapOpContentMapper.ensureInitialized()
        .encodeJson<MapOpContent>(this as MapOpContent);
  }

  Map<String, dynamic> toMap() {
    return MapOpContentMapper.ensureInitialized()
        .encodeMap<MapOpContent>(this as MapOpContent);
  }

  MapOpContentCopyWith<MapOpContent, MapOpContent, MapOpContent> get copyWith =>
      _MapOpContentCopyWithImpl<MapOpContent, MapOpContent>(
          this as MapOpContent, $identity, $identity);
  @override
  String toString() {
    return MapOpContentMapper.ensureInitialized()
        .stringifyValue(this as MapOpContent);
  }

  @override
  bool operator ==(Object other) {
    return MapOpContentMapper.ensureInitialized()
        .equalsValue(this as MapOpContent, other);
  }

  @override
  int get hashCode {
    return MapOpContentMapper.ensureInitialized()
        .hashValue(this as MapOpContent);
  }
}

extension MapOpContentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, MapOpContent, $Out> {
  MapOpContentCopyWith<$R, MapOpContent, $Out> get $asMapOpContent =>
      $base.as((v, t, t2) => _MapOpContentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class MapOpContentCopyWith<$R, $In extends MapOpContent, $Out>
    implements OpContentCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get value;
  @override
  $R call({Map<String, dynamic>? value});
  MapOpContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _MapOpContentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, MapOpContent, $Out>
    implements MapOpContentCopyWith<$R, MapOpContent, $Out> {
  _MapOpContentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<MapOpContent> $mapper =
      MapOpContentMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get value => MapCopyWith($value.value,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(value: v));
  @override
  $R call({Map<String, dynamic>? value}) =>
      $apply(FieldCopyWithData({if (value != null) #value: value}));
  @override
  MapOpContent $make(CopyWithData data) =>
      MapOpContent(data.get(#value, or: $value.value));

  @override
  MapOpContentCopyWith<$R2, MapOpContent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _MapOpContentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'dir_op_context.dart';

class DirOpContextMapper extends ClassMapperBase<DirOpContext> {
  DirOpContextMapper._();

  static DirOpContextMapper? _instance;
  static DirOpContextMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DirOpContextMapper._());
      DirOpContextCreateMapper.ensureInitialized();
      DirOpContextReadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'DirOpContext';

  @override
  final MappableFields<DirOpContext> fields = const {};

  static DirOpContext _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'DirOpContext', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static DirOpContext fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirOpContext>(map);
  }

  static DirOpContext fromJson(String json) {
    return ensureInitialized().decodeJson<DirOpContext>(json);
  }
}

mixin DirOpContextMappable {
  String toJson();
  Map<String, dynamic> toMap();
  DirOpContextCopyWith<DirOpContext, DirOpContext, DirOpContext> get copyWith;
}

abstract class DirOpContextCopyWith<$R, $In extends DirOpContext, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  DirOpContextCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class DirOpContextCreateMapper extends SubClassMapperBase<DirOpContextCreate> {
  DirOpContextCreateMapper._();

  static DirOpContextCreateMapper? _instance;
  static DirOpContextCreateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DirOpContextCreateMapper._());
      DirOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'DirOpContextCreate';

  static String _$path(DirOpContextCreate v) => v.path;
  static const Field<DirOpContextCreate, String> _f$path =
      Field('path', _$path);

  @override
  final MappableFields<DirOpContextCreate> fields = const {
    #path: _f$path,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'create';
  @override
  late final ClassMapperBase superMapper =
      DirOpContextMapper.ensureInitialized();

  static DirOpContextCreate _instantiate(DecodingData data) {
    return DirOpContextCreate(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static DirOpContextCreate fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirOpContextCreate>(map);
  }

  static DirOpContextCreate fromJson(String json) {
    return ensureInitialized().decodeJson<DirOpContextCreate>(json);
  }
}

mixin DirOpContextCreateMappable {
  String toJson() {
    return DirOpContextCreateMapper.ensureInitialized()
        .encodeJson<DirOpContextCreate>(this as DirOpContextCreate);
  }

  Map<String, dynamic> toMap() {
    return DirOpContextCreateMapper.ensureInitialized()
        .encodeMap<DirOpContextCreate>(this as DirOpContextCreate);
  }

  DirOpContextCreateCopyWith<DirOpContextCreate, DirOpContextCreate,
          DirOpContextCreate>
      get copyWith => _DirOpContextCreateCopyWithImpl<DirOpContextCreate,
          DirOpContextCreate>(this as DirOpContextCreate, $identity, $identity);
  @override
  String toString() {
    return DirOpContextCreateMapper.ensureInitialized()
        .stringifyValue(this as DirOpContextCreate);
  }

  @override
  bool operator ==(Object other) {
    return DirOpContextCreateMapper.ensureInitialized()
        .equalsValue(this as DirOpContextCreate, other);
  }

  @override
  int get hashCode {
    return DirOpContextCreateMapper.ensureInitialized()
        .hashValue(this as DirOpContextCreate);
  }
}

extension DirOpContextCreateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DirOpContextCreate, $Out> {
  DirOpContextCreateCopyWith<$R, DirOpContextCreate, $Out>
      get $asDirOpContextCreate => $base.as(
          (v, t, t2) => _DirOpContextCreateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DirOpContextCreateCopyWith<$R, $In extends DirOpContextCreate,
    $Out> implements DirOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  DirOpContextCreateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DirOpContextCreateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DirOpContextCreate, $Out>
    implements DirOpContextCreateCopyWith<$R, DirOpContextCreate, $Out> {
  _DirOpContextCreateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DirOpContextCreate> $mapper =
      DirOpContextCreateMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  DirOpContextCreate $make(CopyWithData data) =>
      DirOpContextCreate(path: data.get(#path, or: $value.path));

  @override
  DirOpContextCreateCopyWith<$R2, DirOpContextCreate, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DirOpContextCreateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class DirOpContextReadMapper extends SubClassMapperBase<DirOpContextRead> {
  DirOpContextReadMapper._();

  static DirOpContextReadMapper? _instance;
  static DirOpContextReadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DirOpContextReadMapper._());
      DirOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'DirOpContextRead';

  static String _$path(DirOpContextRead v) => v.path;
  static const Field<DirOpContextRead, String> _f$path = Field('path', _$path);

  @override
  final MappableFields<DirOpContextRead> fields = const {
    #path: _f$path,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'read';
  @override
  late final ClassMapperBase superMapper =
      DirOpContextMapper.ensureInitialized();

  static DirOpContextRead _instantiate(DecodingData data) {
    return DirOpContextRead(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static DirOpContextRead fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<DirOpContextRead>(map);
  }

  static DirOpContextRead fromJson(String json) {
    return ensureInitialized().decodeJson<DirOpContextRead>(json);
  }
}

mixin DirOpContextReadMappable {
  String toJson() {
    return DirOpContextReadMapper.ensureInitialized()
        .encodeJson<DirOpContextRead>(this as DirOpContextRead);
  }

  Map<String, dynamic> toMap() {
    return DirOpContextReadMapper.ensureInitialized()
        .encodeMap<DirOpContextRead>(this as DirOpContextRead);
  }

  DirOpContextReadCopyWith<DirOpContextRead, DirOpContextRead, DirOpContextRead>
      get copyWith =>
          _DirOpContextReadCopyWithImpl<DirOpContextRead, DirOpContextRead>(
              this as DirOpContextRead, $identity, $identity);
  @override
  String toString() {
    return DirOpContextReadMapper.ensureInitialized()
        .stringifyValue(this as DirOpContextRead);
  }

  @override
  bool operator ==(Object other) {
    return DirOpContextReadMapper.ensureInitialized()
        .equalsValue(this as DirOpContextRead, other);
  }

  @override
  int get hashCode {
    return DirOpContextReadMapper.ensureInitialized()
        .hashValue(this as DirOpContextRead);
  }
}

extension DirOpContextReadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, DirOpContextRead, $Out> {
  DirOpContextReadCopyWith<$R, DirOpContextRead, $Out>
      get $asDirOpContextRead => $base
          .as((v, t, t2) => _DirOpContextReadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class DirOpContextReadCopyWith<$R, $In extends DirOpContextRead, $Out>
    implements DirOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  DirOpContextReadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _DirOpContextReadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, DirOpContextRead, $Out>
    implements DirOpContextReadCopyWith<$R, DirOpContextRead, $Out> {
  _DirOpContextReadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<DirOpContextRead> $mapper =
      DirOpContextReadMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  DirOpContextRead $make(CopyWithData data) =>
      DirOpContextRead(path: data.get(#path, or: $value.path));

  @override
  DirOpContextReadCopyWith<$R2, DirOpContextRead, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DirOpContextReadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

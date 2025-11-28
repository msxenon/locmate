// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'crud_file_locale_model.dart';

class ArbFileEntityMapper extends ClassMapperBase<ArbFileEntity> {
  ArbFileEntityMapper._();

  static ArbFileEntityMapper? _instance;
  static ArbFileEntityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ArbFileEntityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ArbFileEntity';

  static Map<String, dynamic> _$values(ArbFileEntity v) => v.values;
  static const Field<ArbFileEntity, Map<String, dynamic>> _f$values =
      Field('values', _$values);
  static String _$fileName(ArbFileEntity v) => v.fileName;
  static const Field<ArbFileEntity, String> _f$fileName =
      Field('fileName', _$fileName);
  static Locale _$locale(ArbFileEntity v) => v.locale;
  static const Field<ArbFileEntity, Locale> _f$locale =
      Field('locale', _$locale, mode: FieldMode.member);

  @override
  final MappableFields<ArbFileEntity> fields = const {
    #values: _f$values,
    #fileName: _f$fileName,
    #locale: _f$locale,
  };

  static ArbFileEntity _instantiate(DecodingData data) {
    return ArbFileEntity(
        values: data.dec(_f$values), fileName: data.dec(_f$fileName));
  }

  @override
  final Function instantiate = _instantiate;

  static ArbFileEntity fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ArbFileEntity>(map);
  }

  static ArbFileEntity fromJson(String json) {
    return ensureInitialized().decodeJson<ArbFileEntity>(json);
  }
}

mixin ArbFileEntityMappable {
  String toJson() {
    return ArbFileEntityMapper.ensureInitialized()
        .encodeJson<ArbFileEntity>(this as ArbFileEntity);
  }

  Map<String, dynamic> toMap() {
    return ArbFileEntityMapper.ensureInitialized()
        .encodeMap<ArbFileEntity>(this as ArbFileEntity);
  }

  ArbFileEntityCopyWith<ArbFileEntity, ArbFileEntity, ArbFileEntity>
      get copyWith => _ArbFileEntityCopyWithImpl<ArbFileEntity, ArbFileEntity>(
          this as ArbFileEntity, $identity, $identity);
  @override
  String toString() {
    return ArbFileEntityMapper.ensureInitialized()
        .stringifyValue(this as ArbFileEntity);
  }

  @override
  bool operator ==(Object other) {
    return ArbFileEntityMapper.ensureInitialized()
        .equalsValue(this as ArbFileEntity, other);
  }

  @override
  int get hashCode {
    return ArbFileEntityMapper.ensureInitialized()
        .hashValue(this as ArbFileEntity);
  }
}

extension ArbFileEntityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ArbFileEntity, $Out> {
  ArbFileEntityCopyWith<$R, ArbFileEntity, $Out> get $asArbFileEntity =>
      $base.as((v, t, t2) => _ArbFileEntityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ArbFileEntityCopyWith<$R, $In extends ArbFileEntity, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get values;
  $R call({Map<String, dynamic>? values, String? fileName});
  ArbFileEntityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ArbFileEntityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ArbFileEntity, $Out>
    implements ArbFileEntityCopyWith<$R, ArbFileEntity, $Out> {
  _ArbFileEntityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ArbFileEntity> $mapper =
      ArbFileEntityMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get values => MapCopyWith($value.values,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(values: v));
  @override
  $R call({Map<String, dynamic>? values, String? fileName}) =>
      $apply(FieldCopyWithData({
        if (values != null) #values: values,
        if (fileName != null) #fileName: fileName
      }));
  @override
  ArbFileEntity $make(CopyWithData data) => ArbFileEntity(
      values: data.get(#values, or: $value.values),
      fileName: data.get(#fileName, or: $value.fileName));

  @override
  ArbFileEntityCopyWith<$R2, ArbFileEntity, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ArbFileEntityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

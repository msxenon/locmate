// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'lang_model.dart';

class LangModelMapper extends ClassMapperBase<LangModel> {
  LangModelMapper._();

  static LangModelMapper? _instance;
  static LangModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LangModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LangModel';

  static Locale _$locale(LangModel v) => v.locale;
  static const Field<LangModel, Locale> _f$locale = Field('locale', _$locale);
  static int? _$langCompletionPercentage(LangModel v) =>
      v.langCompletionPercentage;
  static const Field<LangModel, int> _f$langCompletionPercentage =
      Field('langCompletionPercentage', _$langCompletionPercentage);

  @override
  final MappableFields<LangModel> fields = const {
    #locale: _f$locale,
    #langCompletionPercentage: _f$langCompletionPercentage,
  };

  static LangModel _instantiate(DecodingData data) {
    return LangModel(
        locale: data.dec(_f$locale),
        langCompletionPercentage: data.dec(_f$langCompletionPercentage));
  }

  @override
  final Function instantiate = _instantiate;

  static LangModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LangModel>(map);
  }

  static LangModel fromJson(String json) {
    return ensureInitialized().decodeJson<LangModel>(json);
  }
}

mixin LangModelMappable {
  String toJson() {
    return LangModelMapper.ensureInitialized()
        .encodeJson<LangModel>(this as LangModel);
  }

  Map<String, dynamic> toMap() {
    return LangModelMapper.ensureInitialized()
        .encodeMap<LangModel>(this as LangModel);
  }

  LangModelCopyWith<LangModel, LangModel, LangModel> get copyWith =>
      _LangModelCopyWithImpl<LangModel, LangModel>(
          this as LangModel, $identity, $identity);
  @override
  String toString() {
    return LangModelMapper.ensureInitialized()
        .stringifyValue(this as LangModel);
  }

  @override
  bool operator ==(Object other) {
    return LangModelMapper.ensureInitialized()
        .equalsValue(this as LangModel, other);
  }

  @override
  int get hashCode {
    return LangModelMapper.ensureInitialized().hashValue(this as LangModel);
  }
}

extension LangModelValueCopy<$R, $Out> on ObjectCopyWith<$R, LangModel, $Out> {
  LangModelCopyWith<$R, LangModel, $Out> get $asLangModel =>
      $base.as((v, t, t2) => _LangModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LangModelCopyWith<$R, $In extends LangModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({Locale? locale, int? langCompletionPercentage});
  LangModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LangModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LangModel, $Out>
    implements LangModelCopyWith<$R, LangModel, $Out> {
  _LangModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LangModel> $mapper =
      LangModelMapper.ensureInitialized();
  @override
  $R call({Locale? locale, Object? langCompletionPercentage = $none}) =>
      $apply(FieldCopyWithData({
        if (locale != null) #locale: locale,
        if (langCompletionPercentage != $none)
          #langCompletionPercentage: langCompletionPercentage
      }));
  @override
  LangModel $make(CopyWithData data) => LangModel(
      locale: data.get(#locale, or: $value.locale),
      langCompletionPercentage: data.get(#langCompletionPercentage,
          or: $value.langCompletionPercentage));

  @override
  LangModelCopyWith<$R2, LangModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LangModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

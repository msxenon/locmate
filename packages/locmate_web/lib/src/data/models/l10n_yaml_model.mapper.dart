// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'l10n_yaml_model.dart';

class L10nYamlModelMapper extends ClassMapperBase<L10nYamlModel> {
  L10nYamlModelMapper._();

  static L10nYamlModelMapper? _instance;
  static L10nYamlModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = L10nYamlModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'L10nYamlModel';

  static String _$arbDir(L10nYamlModel v) => v.arbDir;
  static const Field<L10nYamlModel, String> _f$arbDir =
      Field('arbDir', _$arbDir, key: r'arb-dir');
  static String _$templateArbFile(L10nYamlModel v) => v.templateArbFile;
  static const Field<L10nYamlModel, String> _f$templateArbFile =
      Field('templateArbFile', _$templateArbFile, key: r'template-arb-file');

  @override
  final MappableFields<L10nYamlModel> fields = const {
    #arbDir: _f$arbDir,
    #templateArbFile: _f$templateArbFile,
  };
  @override
  final bool ignoreNull = true;

  static L10nYamlModel _instantiate(DecodingData data) {
    return L10nYamlModel(
        arbDir: data.dec(_f$arbDir),
        templateArbFile: data.dec(_f$templateArbFile));
  }

  @override
  final Function instantiate = _instantiate;

  static L10nYamlModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<L10nYamlModel>(map);
  }

  static L10nYamlModel fromJson(String json) {
    return ensureInitialized().decodeJson<L10nYamlModel>(json);
  }
}

mixin L10nYamlModelMappable {
  String toJson() {
    return L10nYamlModelMapper.ensureInitialized()
        .encodeJson<L10nYamlModel>(this as L10nYamlModel);
  }

  Map<String, dynamic> toMap() {
    return L10nYamlModelMapper.ensureInitialized()
        .encodeMap<L10nYamlModel>(this as L10nYamlModel);
  }

  L10nYamlModelCopyWith<L10nYamlModel, L10nYamlModel, L10nYamlModel>
      get copyWith => _L10nYamlModelCopyWithImpl<L10nYamlModel, L10nYamlModel>(
          this as L10nYamlModel, $identity, $identity);
  @override
  String toString() {
    return L10nYamlModelMapper.ensureInitialized()
        .stringifyValue(this as L10nYamlModel);
  }

  @override
  bool operator ==(Object other) {
    return L10nYamlModelMapper.ensureInitialized()
        .equalsValue(this as L10nYamlModel, other);
  }

  @override
  int get hashCode {
    return L10nYamlModelMapper.ensureInitialized()
        .hashValue(this as L10nYamlModel);
  }
}

extension L10nYamlModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, L10nYamlModel, $Out> {
  L10nYamlModelCopyWith<$R, L10nYamlModel, $Out> get $asL10nYamlModel =>
      $base.as((v, t, t2) => _L10nYamlModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class L10nYamlModelCopyWith<$R, $In extends L10nYamlModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? arbDir, String? templateArbFile});
  L10nYamlModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _L10nYamlModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, L10nYamlModel, $Out>
    implements L10nYamlModelCopyWith<$R, L10nYamlModel, $Out> {
  _L10nYamlModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<L10nYamlModel> $mapper =
      L10nYamlModelMapper.ensureInitialized();
  @override
  $R call({String? arbDir, String? templateArbFile}) =>
      $apply(FieldCopyWithData({
        if (arbDir != null) #arbDir: arbDir,
        if (templateArbFile != null) #templateArbFile: templateArbFile
      }));
  @override
  L10nYamlModel $make(CopyWithData data) => L10nYamlModel(
      arbDir: data.get(#arbDir, or: $value.arbDir),
      templateArbFile: data.get(#templateArbFile, or: $value.templateArbFile));

  @override
  L10nYamlModelCopyWith<$R2, L10nYamlModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _L10nYamlModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

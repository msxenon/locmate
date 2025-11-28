// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_model.dart';

class ProjectModelMapper extends ClassMapperBase<ProjectModel> {
  ProjectModelMapper._();

  static ProjectModelMapper? _instance;
  static ProjectModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectModelMapper._());
      KeyFormatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectModel';

  static String _$arbDir(ProjectModel v) => v.arbDir;
  static const Field<ProjectModel, String> _f$arbDir =
      Field('arbDir', _$arbDir);
  static List<String> _$localesOrder(ProjectModel v) => v.localesOrder;
  static const Field<ProjectModel, List<String>> _f$localesOrder =
      Field('localesOrder', _$localesOrder);
  static String _$path(ProjectModel v) => v.path;
  static const Field<ProjectModel, String> _f$path = Field('path', _$path);
  static KeyFormat? _$keyFormat(ProjectModel v) => v.keyFormat;
  static const Field<ProjectModel, KeyFormat> _f$keyFormat =
      Field('keyFormat', _$keyFormat);
  static String? _$templateArbFile(ProjectModel v) => v.templateArbFile;
  static const Field<ProjectModel, String> _f$templateArbFile =
      Field('templateArbFile', _$templateArbFile);

  @override
  final MappableFields<ProjectModel> fields = const {
    #arbDir: _f$arbDir,
    #localesOrder: _f$localesOrder,
    #path: _f$path,
    #keyFormat: _f$keyFormat,
    #templateArbFile: _f$templateArbFile,
  };

  static ProjectModel _instantiate(DecodingData data) {
    return ProjectModel(
        arbDir: data.dec(_f$arbDir),
        localesOrder: data.dec(_f$localesOrder),
        path: data.dec(_f$path),
        keyFormat: data.dec(_f$keyFormat),
        templateArbFile: data.dec(_f$templateArbFile));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectModel>(map);
  }

  static ProjectModel fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectModel>(json);
  }
}

mixin ProjectModelMappable {
  String toJson() {
    return ProjectModelMapper.ensureInitialized()
        .encodeJson<ProjectModel>(this as ProjectModel);
  }

  Map<String, dynamic> toMap() {
    return ProjectModelMapper.ensureInitialized()
        .encodeMap<ProjectModel>(this as ProjectModel);
  }

  ProjectModelCopyWith<ProjectModel, ProjectModel, ProjectModel> get copyWith =>
      _ProjectModelCopyWithImpl<ProjectModel, ProjectModel>(
          this as ProjectModel, $identity, $identity);
  @override
  String toString() {
    return ProjectModelMapper.ensureInitialized()
        .stringifyValue(this as ProjectModel);
  }

  @override
  bool operator ==(Object other) {
    return ProjectModelMapper.ensureInitialized()
        .equalsValue(this as ProjectModel, other);
  }

  @override
  int get hashCode {
    return ProjectModelMapper.ensureInitialized()
        .hashValue(this as ProjectModel);
  }
}

extension ProjectModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectModel, $Out> {
  ProjectModelCopyWith<$R, ProjectModel, $Out> get $asProjectModel =>
      $base.as((v, t, t2) => _ProjectModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProjectModelCopyWith<$R, $In extends ProjectModel, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get localesOrder;
  $R call(
      {String? arbDir,
      List<String>? localesOrder,
      String? path,
      KeyFormat? keyFormat,
      String? templateArbFile});
  ProjectModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectModel, $Out>
    implements ProjectModelCopyWith<$R, ProjectModel, $Out> {
  _ProjectModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectModel> $mapper =
      ProjectModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get localesOrder => ListCopyWith(
          $value.localesOrder,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(localesOrder: v));
  @override
  $R call(
          {String? arbDir,
          List<String>? localesOrder,
          String? path,
          Object? keyFormat = $none,
          Object? templateArbFile = $none}) =>
      $apply(FieldCopyWithData({
        if (arbDir != null) #arbDir: arbDir,
        if (localesOrder != null) #localesOrder: localesOrder,
        if (path != null) #path: path,
        if (keyFormat != $none) #keyFormat: keyFormat,
        if (templateArbFile != $none) #templateArbFile: templateArbFile
      }));
  @override
  ProjectModel $make(CopyWithData data) => ProjectModel(
      arbDir: data.get(#arbDir, or: $value.arbDir),
      localesOrder: data.get(#localesOrder, or: $value.localesOrder),
      path: data.get(#path, or: $value.path),
      keyFormat: data.get(#keyFormat, or: $value.keyFormat),
      templateArbFile: data.get(#templateArbFile, or: $value.templateArbFile));

  @override
  ProjectModelCopyWith<$R2, ProjectModel, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

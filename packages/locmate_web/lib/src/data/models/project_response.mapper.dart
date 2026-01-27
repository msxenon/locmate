// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project_response.dart';

class ProjectResponseMapper extends ClassMapperBase<ProjectResponse> {
  ProjectResponseMapper._();

  static ProjectResponseMapper? _instance;
  static ProjectResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectResponseMapper._());
      ProjectDataMapper.ensureInitialized();
      ProjectEmptyMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectResponse';

  static String _$projectPath(ProjectResponse v) => v.projectPath;
  static const Field<ProjectResponse, String> _f$projectPath =
      Field('projectPath', _$projectPath);

  @override
  final MappableFields<ProjectResponse> fields = const {
    #projectPath: _f$projectPath,
  };
  @override
  final bool ignoreNull = true;

  static ProjectResponse _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'ProjectResponse', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectResponse>(map);
  }

  static ProjectResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectResponse>(json);
  }
}

mixin ProjectResponseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  ProjectResponseCopyWith<ProjectResponse, ProjectResponse, ProjectResponse>
      get copyWith;
}

abstract class ProjectResponseCopyWith<$R, $In extends ProjectResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? projectPath});
  ProjectResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class ProjectDataMapper extends SubClassMapperBase<ProjectData> {
  ProjectDataMapper._();

  static ProjectDataMapper? _instance;
  static ProjectDataMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectDataMapper._());
      ProjectResponseMapper.ensureInitialized().addSubMapper(_instance!);
      LocmateSettingsModelMapper.ensureInitialized();
      L10nYamlModelMapper.ensureInitialized();
      ArbFileEntityMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectData';

  static LocmateSettingsModel? _$locmateSettingsModel(ProjectData v) =>
      v.locmateSettingsModel;
  static const Field<ProjectData, LocmateSettingsModel>
      _f$locmateSettingsModel =
      Field('locmateSettingsModel', _$locmateSettingsModel);
  static String _$projectPath(ProjectData v) => v.projectPath;
  static const Field<ProjectData, String> _f$projectPath =
      Field('projectPath', _$projectPath);
  static L10nYamlModel _$l10nYaml(ProjectData v) => v.l10nYaml;
  static const Field<ProjectData, L10nYamlModel> _f$l10nYaml =
      Field('l10nYaml', _$l10nYaml);
  static List<ArbFileEntity> _$arbFileEntities(ProjectData v) =>
      v.arbFileEntities;
  static const Field<ProjectData, List<ArbFileEntity>> _f$arbFileEntities =
      Field('arbFileEntities', _$arbFileEntities);
  static String? _$pubspecProjectName(ProjectData v) => v.pubspecProjectName;
  static const Field<ProjectData, String> _f$pubspecProjectName =
      Field('pubspecProjectName', _$pubspecProjectName, opt: true);

  @override
  final MappableFields<ProjectData> fields = const {
    #locmateSettingsModel: _f$locmateSettingsModel,
    #projectPath: _f$projectPath,
    #l10nYaml: _f$l10nYaml,
    #arbFileEntities: _f$arbFileEntities,
    #pubspecProjectName: _f$pubspecProjectName,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'data';
  @override
  late final ClassMapperBase superMapper =
      ProjectResponseMapper.ensureInitialized();

  static ProjectData _instantiate(DecodingData data) {
    return ProjectData(
        locmateSettingsModel: data.dec(_f$locmateSettingsModel),
        projectPath: data.dec(_f$projectPath),
        l10nYaml: data.dec(_f$l10nYaml),
        arbFileEntities: data.dec(_f$arbFileEntities),
        pubspecProjectName: data.dec(_f$pubspecProjectName));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectData fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectData>(map);
  }

  static ProjectData fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectData>(json);
  }
}

mixin ProjectDataMappable {
  String toJson() {
    return ProjectDataMapper.ensureInitialized()
        .encodeJson<ProjectData>(this as ProjectData);
  }

  Map<String, dynamic> toMap() {
    return ProjectDataMapper.ensureInitialized()
        .encodeMap<ProjectData>(this as ProjectData);
  }

  ProjectDataCopyWith<ProjectData, ProjectData, ProjectData> get copyWith =>
      _ProjectDataCopyWithImpl<ProjectData, ProjectData>(
          this as ProjectData, $identity, $identity);
  @override
  String toString() {
    return ProjectDataMapper.ensureInitialized()
        .stringifyValue(this as ProjectData);
  }

  @override
  bool operator ==(Object other) {
    return ProjectDataMapper.ensureInitialized()
        .equalsValue(this as ProjectData, other);
  }

  @override
  int get hashCode {
    return ProjectDataMapper.ensureInitialized().hashValue(this as ProjectData);
  }
}

extension ProjectDataValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectData, $Out> {
  ProjectDataCopyWith<$R, ProjectData, $Out> get $asProjectData =>
      $base.as((v, t, t2) => _ProjectDataCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProjectDataCopyWith<$R, $In extends ProjectData, $Out>
    implements ProjectResponseCopyWith<$R, $In, $Out> {
  LocmateSettingsModelCopyWith<$R, LocmateSettingsModel, LocmateSettingsModel>?
      get locmateSettingsModel;
  L10nYamlModelCopyWith<$R, L10nYamlModel, L10nYamlModel> get l10nYaml;
  ListCopyWith<$R, ArbFileEntity,
          ArbFileEntityCopyWith<$R, ArbFileEntity, ArbFileEntity>>
      get arbFileEntities;
  @override
  $R call(
      {LocmateSettingsModel? locmateSettingsModel,
      String? projectPath,
      L10nYamlModel? l10nYaml,
      List<ArbFileEntity>? arbFileEntities,
      String? pubspecProjectName});
  ProjectDataCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectDataCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectData, $Out>
    implements ProjectDataCopyWith<$R, ProjectData, $Out> {
  _ProjectDataCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectData> $mapper =
      ProjectDataMapper.ensureInitialized();
  @override
  LocmateSettingsModelCopyWith<$R, LocmateSettingsModel, LocmateSettingsModel>?
      get locmateSettingsModel => $value.locmateSettingsModel?.copyWith
          .$chain((v) => call(locmateSettingsModel: v));
  @override
  L10nYamlModelCopyWith<$R, L10nYamlModel, L10nYamlModel> get l10nYaml =>
      $value.l10nYaml.copyWith.$chain((v) => call(l10nYaml: v));
  @override
  ListCopyWith<$R, ArbFileEntity,
          ArbFileEntityCopyWith<$R, ArbFileEntity, ArbFileEntity>>
      get arbFileEntities => ListCopyWith($value.arbFileEntities,
          (v, t) => v.copyWith.$chain(t), (v) => call(arbFileEntities: v));
  @override
  $R call(
          {Object? locmateSettingsModel = $none,
          String? projectPath,
          L10nYamlModel? l10nYaml,
          List<ArbFileEntity>? arbFileEntities,
          Object? pubspecProjectName = $none}) =>
      $apply(FieldCopyWithData({
        if (locmateSettingsModel != $none)
          #locmateSettingsModel: locmateSettingsModel,
        if (projectPath != null) #projectPath: projectPath,
        if (l10nYaml != null) #l10nYaml: l10nYaml,
        if (arbFileEntities != null) #arbFileEntities: arbFileEntities,
        if (pubspecProjectName != $none) #pubspecProjectName: pubspecProjectName
      }));
  @override
  ProjectData $make(CopyWithData data) => ProjectData(
      locmateSettingsModel:
          data.get(#locmateSettingsModel, or: $value.locmateSettingsModel),
      projectPath: data.get(#projectPath, or: $value.projectPath),
      l10nYaml: data.get(#l10nYaml, or: $value.l10nYaml),
      arbFileEntities: data.get(#arbFileEntities, or: $value.arbFileEntities),
      pubspecProjectName:
          data.get(#pubspecProjectName, or: $value.pubspecProjectName));

  @override
  ProjectDataCopyWith<$R2, ProjectData, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectDataCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ProjectEmptyMapper extends SubClassMapperBase<ProjectEmpty> {
  ProjectEmptyMapper._();

  static ProjectEmptyMapper? _instance;
  static ProjectEmptyMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectEmptyMapper._());
      ProjectResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ProjectEmpty';

  static String _$projectPath(ProjectEmpty v) => v.projectPath;
  static const Field<ProjectEmpty, String> _f$projectPath =
      Field('projectPath', _$projectPath);

  @override
  final MappableFields<ProjectEmpty> fields = const {
    #projectPath: _f$projectPath,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'empty';
  @override
  late final ClassMapperBase superMapper =
      ProjectResponseMapper.ensureInitialized();

  static ProjectEmpty _instantiate(DecodingData data) {
    return ProjectEmpty(projectPath: data.dec(_f$projectPath));
  }

  @override
  final Function instantiate = _instantiate;

  static ProjectEmpty fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ProjectEmpty>(map);
  }

  static ProjectEmpty fromJson(String json) {
    return ensureInitialized().decodeJson<ProjectEmpty>(json);
  }
}

mixin ProjectEmptyMappable {
  String toJson() {
    return ProjectEmptyMapper.ensureInitialized()
        .encodeJson<ProjectEmpty>(this as ProjectEmpty);
  }

  Map<String, dynamic> toMap() {
    return ProjectEmptyMapper.ensureInitialized()
        .encodeMap<ProjectEmpty>(this as ProjectEmpty);
  }

  ProjectEmptyCopyWith<ProjectEmpty, ProjectEmpty, ProjectEmpty> get copyWith =>
      _ProjectEmptyCopyWithImpl<ProjectEmpty, ProjectEmpty>(
          this as ProjectEmpty, $identity, $identity);
  @override
  String toString() {
    return ProjectEmptyMapper.ensureInitialized()
        .stringifyValue(this as ProjectEmpty);
  }

  @override
  bool operator ==(Object other) {
    return ProjectEmptyMapper.ensureInitialized()
        .equalsValue(this as ProjectEmpty, other);
  }

  @override
  int get hashCode {
    return ProjectEmptyMapper.ensureInitialized()
        .hashValue(this as ProjectEmpty);
  }
}

extension ProjectEmptyValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ProjectEmpty, $Out> {
  ProjectEmptyCopyWith<$R, ProjectEmpty, $Out> get $asProjectEmpty =>
      $base.as((v, t, t2) => _ProjectEmptyCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProjectEmptyCopyWith<$R, $In extends ProjectEmpty, $Out>
    implements ProjectResponseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? projectPath});
  ProjectEmptyCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectEmptyCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ProjectEmpty, $Out>
    implements ProjectEmptyCopyWith<$R, ProjectEmpty, $Out> {
  _ProjectEmptyCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ProjectEmpty> $mapper =
      ProjectEmptyMapper.ensureInitialized();
  @override
  $R call({String? projectPath}) => $apply(
      FieldCopyWithData({if (projectPath != null) #projectPath: projectPath}));
  @override
  ProjectEmpty $make(CopyWithData data) =>
      ProjectEmpty(projectPath: data.get(#projectPath, or: $value.projectPath));

  @override
  ProjectEmptyCopyWith<$R2, ProjectEmpty, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ProjectEmptyCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

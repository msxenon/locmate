// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'home_screen_state.dart';

class HomeScreenStateMapper extends ClassMapperBase<HomeScreenState> {
  HomeScreenStateMapper._();

  static HomeScreenStateMapper? _instance;
  static HomeScreenStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HomeScreenStateMapper._());
      ProjectModelMapper.ensureInitialized();
      KeyFormatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'HomeScreenState';

  static String _$arbDir(HomeScreenState v) => v.arbDir;
  static const Field<HomeScreenState, String> _f$arbDir =
      Field('arbDir', _$arbDir);
  static List<String> _$localesOrder(HomeScreenState v) => v.localesOrder;
  static const Field<HomeScreenState, List<String>> _f$localesOrder =
      Field('localesOrder', _$localesOrder);
  static String _$path(HomeScreenState v) => v.path;
  static const Field<HomeScreenState, String> _f$path = Field('path', _$path);
  static List<String> _$langs(HomeScreenState v) => v.langs;
  static const Field<HomeScreenState, List<String>> _f$langs =
      Field('langs', _$langs);
  static String _$branch(HomeScreenState v) => v.branch;
  static const Field<HomeScreenState, String> _f$branch =
      Field('branch', _$branch);
  static KeyFormat? _$keyFormat(HomeScreenState v) => v.keyFormat;
  static const Field<HomeScreenState, KeyFormat> _f$keyFormat =
      Field('keyFormat', _$keyFormat);
  static String? _$templateArbFile(HomeScreenState v) => v.templateArbFile;
  static const Field<HomeScreenState, String> _f$templateArbFile =
      Field('templateArbFile', _$templateArbFile);

  @override
  final MappableFields<HomeScreenState> fields = const {
    #arbDir: _f$arbDir,
    #localesOrder: _f$localesOrder,
    #path: _f$path,
    #langs: _f$langs,
    #branch: _f$branch,
    #keyFormat: _f$keyFormat,
    #templateArbFile: _f$templateArbFile,
  };

  static HomeScreenState _instantiate(DecodingData data) {
    return HomeScreenState(
        arbDir: data.dec(_f$arbDir),
        localesOrder: data.dec(_f$localesOrder),
        path: data.dec(_f$path),
        langs: data.dec(_f$langs),
        branch: data.dec(_f$branch),
        keyFormat: data.dec(_f$keyFormat),
        templateArbFile: data.dec(_f$templateArbFile));
  }

  @override
  final Function instantiate = _instantiate;

  static HomeScreenState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<HomeScreenState>(map);
  }

  static HomeScreenState fromJson(String json) {
    return ensureInitialized().decodeJson<HomeScreenState>(json);
  }
}

mixin HomeScreenStateMappable {
  String toJson() {
    return HomeScreenStateMapper.ensureInitialized()
        .encodeJson<HomeScreenState>(this as HomeScreenState);
  }

  Map<String, dynamic> toMap() {
    return HomeScreenStateMapper.ensureInitialized()
        .encodeMap<HomeScreenState>(this as HomeScreenState);
  }

  HomeScreenStateCopyWith<HomeScreenState, HomeScreenState, HomeScreenState>
      get copyWith =>
          _HomeScreenStateCopyWithImpl<HomeScreenState, HomeScreenState>(
              this as HomeScreenState, $identity, $identity);
  @override
  String toString() {
    return HomeScreenStateMapper.ensureInitialized()
        .stringifyValue(this as HomeScreenState);
  }

  @override
  bool operator ==(Object other) {
    return HomeScreenStateMapper.ensureInitialized()
        .equalsValue(this as HomeScreenState, other);
  }

  @override
  int get hashCode {
    return HomeScreenStateMapper.ensureInitialized()
        .hashValue(this as HomeScreenState);
  }
}

extension HomeScreenStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, HomeScreenState, $Out> {
  HomeScreenStateCopyWith<$R, HomeScreenState, $Out> get $asHomeScreenState =>
      $base.as((v, t, t2) => _HomeScreenStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HomeScreenStateCopyWith<$R, $In extends HomeScreenState, $Out>
    implements ProjectModelCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get localesOrder;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get langs;
  @override
  $R call(
      {String? arbDir,
      List<String>? localesOrder,
      String? path,
      List<String>? langs,
      String? branch,
      KeyFormat? keyFormat,
      String? templateArbFile});
  HomeScreenStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _HomeScreenStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, HomeScreenState, $Out>
    implements HomeScreenStateCopyWith<$R, HomeScreenState, $Out> {
  _HomeScreenStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<HomeScreenState> $mapper =
      HomeScreenStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get localesOrder => ListCopyWith(
          $value.localesOrder,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(localesOrder: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get langs =>
      ListCopyWith($value.langs, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(langs: v));
  @override
  $R call(
          {String? arbDir,
          List<String>? localesOrder,
          String? path,
          List<String>? langs,
          String? branch,
          Object? keyFormat = $none,
          Object? templateArbFile = $none}) =>
      $apply(FieldCopyWithData({
        if (arbDir != null) #arbDir: arbDir,
        if (localesOrder != null) #localesOrder: localesOrder,
        if (path != null) #path: path,
        if (langs != null) #langs: langs,
        if (branch != null) #branch: branch,
        if (keyFormat != $none) #keyFormat: keyFormat,
        if (templateArbFile != $none) #templateArbFile: templateArbFile
      }));
  @override
  HomeScreenState $make(CopyWithData data) => HomeScreenState(
      arbDir: data.get(#arbDir, or: $value.arbDir),
      localesOrder: data.get(#localesOrder, or: $value.localesOrder),
      path: data.get(#path, or: $value.path),
      langs: data.get(#langs, or: $value.langs),
      branch: data.get(#branch, or: $value.branch),
      keyFormat: data.get(#keyFormat, or: $value.keyFormat),
      templateArbFile: data.get(#templateArbFile, or: $value.templateArbFile));

  @override
  HomeScreenStateCopyWith<$R2, HomeScreenState, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _HomeScreenStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

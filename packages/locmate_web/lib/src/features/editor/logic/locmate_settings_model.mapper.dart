// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'locmate_settings_model.dart';

class LocmateSettingsModelMapper extends ClassMapperBase<LocmateSettingsModel> {
  LocmateSettingsModelMapper._();

  static LocmateSettingsModelMapper? _instance;
  static LocmateSettingsModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocmateSettingsModelMapper._());
      KeyFormatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LocmateSettingsModel';

  static KeyFormat? _$keyFormat(LocmateSettingsModel v) => v.keyFormat;
  static const Field<LocmateSettingsModel, KeyFormat> _f$keyFormat =
      Field('keyFormat', _$keyFormat, opt: true, def: KeyFormat.none);
  static List<String>? _$localesOrder(LocmateSettingsModel v) => v.localesOrder;
  static const Field<LocmateSettingsModel, List<String>> _f$localesOrder =
      Field('localesOrder', _$localesOrder, opt: true);
  static String? _$projectName(LocmateSettingsModel v) => v.projectName;
  static const Field<LocmateSettingsModel, String> _f$projectName =
      Field('projectName', _$projectName, opt: true);

  @override
  final MappableFields<LocmateSettingsModel> fields = const {
    #keyFormat: _f$keyFormat,
    #localesOrder: _f$localesOrder,
    #projectName: _f$projectName,
  };
  @override
  final bool ignoreNull = true;

  static LocmateSettingsModel _instantiate(DecodingData data) {
    return LocmateSettingsModel(
        keyFormat: data.dec(_f$keyFormat),
        localesOrder: data.dec(_f$localesOrder),
        projectName: data.dec(_f$projectName));
  }

  @override
  final Function instantiate = _instantiate;

  static LocmateSettingsModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocmateSettingsModel>(map);
  }

  static LocmateSettingsModel fromJson(String json) {
    return ensureInitialized().decodeJson<LocmateSettingsModel>(json);
  }
}

mixin LocmateSettingsModelMappable {
  String toJson() {
    return LocmateSettingsModelMapper.ensureInitialized()
        .encodeJson<LocmateSettingsModel>(this as LocmateSettingsModel);
  }

  Map<String, dynamic> toMap() {
    return LocmateSettingsModelMapper.ensureInitialized()
        .encodeMap<LocmateSettingsModel>(this as LocmateSettingsModel);
  }

  LocmateSettingsModelCopyWith<LocmateSettingsModel, LocmateSettingsModel,
      LocmateSettingsModel> get copyWith => _LocmateSettingsModelCopyWithImpl<
          LocmateSettingsModel, LocmateSettingsModel>(
      this as LocmateSettingsModel, $identity, $identity);
  @override
  String toString() {
    return LocmateSettingsModelMapper.ensureInitialized()
        .stringifyValue(this as LocmateSettingsModel);
  }

  @override
  bool operator ==(Object other) {
    return LocmateSettingsModelMapper.ensureInitialized()
        .equalsValue(this as LocmateSettingsModel, other);
  }

  @override
  int get hashCode {
    return LocmateSettingsModelMapper.ensureInitialized()
        .hashValue(this as LocmateSettingsModel);
  }
}

extension LocmateSettingsModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocmateSettingsModel, $Out> {
  LocmateSettingsModelCopyWith<$R, LocmateSettingsModel, $Out>
      get $asLocmateSettingsModel => $base.as(
          (v, t, t2) => _LocmateSettingsModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LocmateSettingsModelCopyWith<
    $R,
    $In extends LocmateSettingsModel,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get localesOrder;
  $R call(
      {KeyFormat? keyFormat, List<String>? localesOrder, String? projectName});
  LocmateSettingsModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocmateSettingsModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocmateSettingsModel, $Out>
    implements LocmateSettingsModelCopyWith<$R, LocmateSettingsModel, $Out> {
  _LocmateSettingsModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocmateSettingsModel> $mapper =
      LocmateSettingsModelMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>?
      get localesOrder => $value.localesOrder != null
          ? ListCopyWith(
              $value.localesOrder!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(localesOrder: v))
          : null;
  @override
  $R call(
          {Object? keyFormat = $none,
          Object? localesOrder = $none,
          Object? projectName = $none}) =>
      $apply(FieldCopyWithData({
        if (keyFormat != $none) #keyFormat: keyFormat,
        if (localesOrder != $none) #localesOrder: localesOrder,
        if (projectName != $none) #projectName: projectName
      }));
  @override
  LocmateSettingsModel $make(CopyWithData data) => LocmateSettingsModel(
      keyFormat: data.get(#keyFormat, or: $value.keyFormat),
      localesOrder: data.get(#localesOrder, or: $value.localesOrder),
      projectName: data.get(#projectName, or: $value.projectName));

  @override
  LocmateSettingsModelCopyWith<$R2, LocmateSettingsModel, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocmateSettingsModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class LocmateSettingsStateMapper extends ClassMapperBase<LocmateSettingsState> {
  LocmateSettingsStateMapper._();

  static LocmateSettingsStateMapper? _instance;
  static LocmateSettingsStateMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocmateSettingsStateMapper._());
      KeyFormatMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'LocmateSettingsState';

  static String _$projectName(LocmateSettingsState v) => v.projectName;
  static const Field<LocmateSettingsState, String> _f$projectName =
      Field('projectName', _$projectName);
  static KeyFormat _$keyFormat(LocmateSettingsState v) => v.keyFormat;
  static const Field<LocmateSettingsState, KeyFormat> _f$keyFormat =
      Field('keyFormat', _$keyFormat);
  static List<String> _$localesOrder(LocmateSettingsState v) => v.localesOrder;
  static const Field<LocmateSettingsState, List<String>> _f$localesOrder =
      Field('localesOrder', _$localesOrder);
  static List<String> _$selectedLangs(LocmateSettingsState v) =>
      v.selectedLangs;
  static const Field<LocmateSettingsState, List<String>> _f$selectedLangs =
      Field('selectedLangs', _$selectedLangs, opt: true, def: const []);

  @override
  final MappableFields<LocmateSettingsState> fields = const {
    #projectName: _f$projectName,
    #keyFormat: _f$keyFormat,
    #localesOrder: _f$localesOrder,
    #selectedLangs: _f$selectedLangs,
  };

  static LocmateSettingsState _instantiate(DecodingData data) {
    return LocmateSettingsState(
        projectName: data.dec(_f$projectName),
        keyFormat: data.dec(_f$keyFormat),
        localesOrder: data.dec(_f$localesOrder),
        selectedLangs: data.dec(_f$selectedLangs));
  }

  @override
  final Function instantiate = _instantiate;

  static LocmateSettingsState fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocmateSettingsState>(map);
  }

  static LocmateSettingsState fromJson(String json) {
    return ensureInitialized().decodeJson<LocmateSettingsState>(json);
  }
}

mixin LocmateSettingsStateMappable {
  String toJson() {
    return LocmateSettingsStateMapper.ensureInitialized()
        .encodeJson<LocmateSettingsState>(this as LocmateSettingsState);
  }

  Map<String, dynamic> toMap() {
    return LocmateSettingsStateMapper.ensureInitialized()
        .encodeMap<LocmateSettingsState>(this as LocmateSettingsState);
  }

  LocmateSettingsStateCopyWith<LocmateSettingsState, LocmateSettingsState,
      LocmateSettingsState> get copyWith => _LocmateSettingsStateCopyWithImpl<
          LocmateSettingsState, LocmateSettingsState>(
      this as LocmateSettingsState, $identity, $identity);
  @override
  String toString() {
    return LocmateSettingsStateMapper.ensureInitialized()
        .stringifyValue(this as LocmateSettingsState);
  }

  @override
  bool operator ==(Object other) {
    return LocmateSettingsStateMapper.ensureInitialized()
        .equalsValue(this as LocmateSettingsState, other);
  }

  @override
  int get hashCode {
    return LocmateSettingsStateMapper.ensureInitialized()
        .hashValue(this as LocmateSettingsState);
  }
}

extension LocmateSettingsStateValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocmateSettingsState, $Out> {
  LocmateSettingsStateCopyWith<$R, LocmateSettingsState, $Out>
      get $asLocmateSettingsState => $base.as(
          (v, t, t2) => _LocmateSettingsStateCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class LocmateSettingsStateCopyWith<
    $R,
    $In extends LocmateSettingsState,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get localesOrder;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get selectedLangs;
  $R call(
      {String? projectName,
      KeyFormat? keyFormat,
      List<String>? localesOrder,
      List<String>? selectedLangs});
  LocmateSettingsStateCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocmateSettingsStateCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocmateSettingsState, $Out>
    implements LocmateSettingsStateCopyWith<$R, LocmateSettingsState, $Out> {
  _LocmateSettingsStateCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocmateSettingsState> $mapper =
      LocmateSettingsStateMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get localesOrder => ListCopyWith(
          $value.localesOrder,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(localesOrder: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
      get selectedLangs => ListCopyWith(
          $value.selectedLangs,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(selectedLangs: v));
  @override
  $R call(
          {String? projectName,
          KeyFormat? keyFormat,
          List<String>? localesOrder,
          List<String>? selectedLangs}) =>
      $apply(FieldCopyWithData({
        if (projectName != null) #projectName: projectName,
        if (keyFormat != null) #keyFormat: keyFormat,
        if (localesOrder != null) #localesOrder: localesOrder,
        if (selectedLangs != null) #selectedLangs: selectedLangs
      }));
  @override
  LocmateSettingsState $make(CopyWithData data) => LocmateSettingsState(
      projectName: data.get(#projectName, or: $value.projectName),
      keyFormat: data.get(#keyFormat, or: $value.keyFormat),
      localesOrder: data.get(#localesOrder, or: $value.localesOrder),
      selectedLangs: data.get(#selectedLangs, or: $value.selectedLangs));

  @override
  LocmateSettingsStateCopyWith<$R2, LocmateSettingsState, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _LocmateSettingsStateCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

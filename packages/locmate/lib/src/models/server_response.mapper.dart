// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'server_response.dart';

class OpResponseMapper extends ClassMapperBase<OpResponse> {
  OpResponseMapper._();

  static OpResponseMapper? _instance;
  static OpResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OpResponseMapper._());
      ListOpResponseMapper.ensureInitialized();
      StringOpResponseMapper.ensureInitialized();
      VoidOpResponseMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'OpResponse';

  @override
  final MappableFields<OpResponse> fields = const {};
  @override
  final bool ignoreNull = true;

  static OpResponse _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'OpResponse', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static OpResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<OpResponse>(map);
  }

  static OpResponse fromJson(String json) {
    return ensureInitialized().decodeJson<OpResponse>(json);
  }
}

mixin OpResponseMappable {
  String toJson();
  Map<String, dynamic> toMap();
  OpResponseCopyWith<OpResponse, OpResponse, OpResponse> get copyWith;
}

abstract class OpResponseCopyWith<$R, $In extends OpResponse, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  OpResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class ListOpResponseMapper extends SubClassMapperBase<ListOpResponse> {
  ListOpResponseMapper._();

  static ListOpResponseMapper? _instance;
  static ListOpResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ListOpResponseMapper._());
      OpResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'ListOpResponse';

  static List<String> _$response(ListOpResponse v) => v.response;
  static const Field<ListOpResponse, List<String>> _f$response =
      Field('response', _$response);

  @override
  final MappableFields<ListOpResponse> fields = const {
    #response: _f$response,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'list';
  @override
  late final ClassMapperBase superMapper = OpResponseMapper.ensureInitialized();

  static ListOpResponse _instantiate(DecodingData data) {
    return ListOpResponse(response: data.dec(_f$response));
  }

  @override
  final Function instantiate = _instantiate;

  static ListOpResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ListOpResponse>(map);
  }

  static ListOpResponse fromJson(String json) {
    return ensureInitialized().decodeJson<ListOpResponse>(json);
  }
}

mixin ListOpResponseMappable {
  String toJson() {
    return ListOpResponseMapper.ensureInitialized()
        .encodeJson<ListOpResponse>(this as ListOpResponse);
  }

  Map<String, dynamic> toMap() {
    return ListOpResponseMapper.ensureInitialized()
        .encodeMap<ListOpResponse>(this as ListOpResponse);
  }

  ListOpResponseCopyWith<ListOpResponse, ListOpResponse, ListOpResponse>
      get copyWith =>
          _ListOpResponseCopyWithImpl<ListOpResponse, ListOpResponse>(
              this as ListOpResponse, $identity, $identity);
  @override
  String toString() {
    return ListOpResponseMapper.ensureInitialized()
        .stringifyValue(this as ListOpResponse);
  }

  @override
  bool operator ==(Object other) {
    return ListOpResponseMapper.ensureInitialized()
        .equalsValue(this as ListOpResponse, other);
  }

  @override
  int get hashCode {
    return ListOpResponseMapper.ensureInitialized()
        .hashValue(this as ListOpResponse);
  }
}

extension ListOpResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ListOpResponse, $Out> {
  ListOpResponseCopyWith<$R, ListOpResponse, $Out> get $asListOpResponse =>
      $base.as((v, t, t2) => _ListOpResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ListOpResponseCopyWith<$R, $In extends ListOpResponse, $Out>
    implements OpResponseCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get response;
  @override
  $R call({List<String>? response});
  ListOpResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ListOpResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ListOpResponse, $Out>
    implements ListOpResponseCopyWith<$R, ListOpResponse, $Out> {
  _ListOpResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ListOpResponse> $mapper =
      ListOpResponseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get response =>
      ListCopyWith($value.response, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(response: v));
  @override
  $R call({List<String>? response}) =>
      $apply(FieldCopyWithData({if (response != null) #response: response}));
  @override
  ListOpResponse $make(CopyWithData data) =>
      ListOpResponse(response: data.get(#response, or: $value.response));

  @override
  ListOpResponseCopyWith<$R2, ListOpResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ListOpResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class StringOpResponseMapper extends SubClassMapperBase<StringOpResponse> {
  StringOpResponseMapper._();

  static StringOpResponseMapper? _instance;
  static StringOpResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StringOpResponseMapper._());
      OpResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'StringOpResponse';

  static String _$response(StringOpResponse v) => v.response;
  static const Field<StringOpResponse, String> _f$response =
      Field('response', _$response);

  @override
  final MappableFields<StringOpResponse> fields = const {
    #response: _f$response,
  };
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'string';
  @override
  late final ClassMapperBase superMapper = OpResponseMapper.ensureInitialized();

  static StringOpResponse _instantiate(DecodingData data) {
    return StringOpResponse(response: data.dec(_f$response));
  }

  @override
  final Function instantiate = _instantiate;

  static StringOpResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<StringOpResponse>(map);
  }

  static StringOpResponse fromJson(String json) {
    return ensureInitialized().decodeJson<StringOpResponse>(json);
  }
}

mixin StringOpResponseMappable {
  String toJson() {
    return StringOpResponseMapper.ensureInitialized()
        .encodeJson<StringOpResponse>(this as StringOpResponse);
  }

  Map<String, dynamic> toMap() {
    return StringOpResponseMapper.ensureInitialized()
        .encodeMap<StringOpResponse>(this as StringOpResponse);
  }

  StringOpResponseCopyWith<StringOpResponse, StringOpResponse, StringOpResponse>
      get copyWith =>
          _StringOpResponseCopyWithImpl<StringOpResponse, StringOpResponse>(
              this as StringOpResponse, $identity, $identity);
  @override
  String toString() {
    return StringOpResponseMapper.ensureInitialized()
        .stringifyValue(this as StringOpResponse);
  }

  @override
  bool operator ==(Object other) {
    return StringOpResponseMapper.ensureInitialized()
        .equalsValue(this as StringOpResponse, other);
  }

  @override
  int get hashCode {
    return StringOpResponseMapper.ensureInitialized()
        .hashValue(this as StringOpResponse);
  }
}

extension StringOpResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, StringOpResponse, $Out> {
  StringOpResponseCopyWith<$R, StringOpResponse, $Out>
      get $asStringOpResponse => $base
          .as((v, t, t2) => _StringOpResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class StringOpResponseCopyWith<$R, $In extends StringOpResponse, $Out>
    implements OpResponseCopyWith<$R, $In, $Out> {
  @override
  $R call({String? response});
  StringOpResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _StringOpResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, StringOpResponse, $Out>
    implements StringOpResponseCopyWith<$R, StringOpResponse, $Out> {
  _StringOpResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<StringOpResponse> $mapper =
      StringOpResponseMapper.ensureInitialized();
  @override
  $R call({String? response}) =>
      $apply(FieldCopyWithData({if (response != null) #response: response}));
  @override
  StringOpResponse $make(CopyWithData data) =>
      StringOpResponse(response: data.get(#response, or: $value.response));

  @override
  StringOpResponseCopyWith<$R2, StringOpResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _StringOpResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class VoidOpResponseMapper extends SubClassMapperBase<VoidOpResponse> {
  VoidOpResponseMapper._();

  static VoidOpResponseMapper? _instance;
  static VoidOpResponseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VoidOpResponseMapper._());
      OpResponseMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'VoidOpResponse';

  @override
  final MappableFields<VoidOpResponse> fields = const {};
  @override
  final bool ignoreNull = true;

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'void';
  @override
  late final ClassMapperBase superMapper = OpResponseMapper.ensureInitialized();

  static VoidOpResponse _instantiate(DecodingData data) {
    return VoidOpResponse();
  }

  @override
  final Function instantiate = _instantiate;

  static VoidOpResponse fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VoidOpResponse>(map);
  }

  static VoidOpResponse fromJson(String json) {
    return ensureInitialized().decodeJson<VoidOpResponse>(json);
  }
}

mixin VoidOpResponseMappable {
  String toJson() {
    return VoidOpResponseMapper.ensureInitialized()
        .encodeJson<VoidOpResponse>(this as VoidOpResponse);
  }

  Map<String, dynamic> toMap() {
    return VoidOpResponseMapper.ensureInitialized()
        .encodeMap<VoidOpResponse>(this as VoidOpResponse);
  }

  VoidOpResponseCopyWith<VoidOpResponse, VoidOpResponse, VoidOpResponse>
      get copyWith =>
          _VoidOpResponseCopyWithImpl<VoidOpResponse, VoidOpResponse>(
              this as VoidOpResponse, $identity, $identity);
  @override
  String toString() {
    return VoidOpResponseMapper.ensureInitialized()
        .stringifyValue(this as VoidOpResponse);
  }

  @override
  bool operator ==(Object other) {
    return VoidOpResponseMapper.ensureInitialized()
        .equalsValue(this as VoidOpResponse, other);
  }

  @override
  int get hashCode {
    return VoidOpResponseMapper.ensureInitialized()
        .hashValue(this as VoidOpResponse);
  }
}

extension VoidOpResponseValueCopy<$R, $Out>
    on ObjectCopyWith<$R, VoidOpResponse, $Out> {
  VoidOpResponseCopyWith<$R, VoidOpResponse, $Out> get $asVoidOpResponse =>
      $base.as((v, t, t2) => _VoidOpResponseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class VoidOpResponseCopyWith<$R, $In extends VoidOpResponse, $Out>
    implements OpResponseCopyWith<$R, $In, $Out> {
  @override
  $R call();
  VoidOpResponseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _VoidOpResponseCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, VoidOpResponse, $Out>
    implements VoidOpResponseCopyWith<$R, VoidOpResponse, $Out> {
  _VoidOpResponseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<VoidOpResponse> $mapper =
      VoidOpResponseMapper.ensureInitialized();
  @override
  $R call() => $apply(FieldCopyWithData({}));
  @override
  VoidOpResponse $make(CopyWithData data) => VoidOpResponse();

  @override
  VoidOpResponseCopyWith<$R2, VoidOpResponse, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _VoidOpResponseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file_op_context.dart';

class FileOpContextMapper extends ClassMapperBase<FileOpContext> {
  FileOpContextMapper._();

  static FileOpContextMapper? _instance;
  static FileOpContextMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileOpContextMapper._());
      FileOpContextWriteMapMapper.ensureInitialized();
      FileOpContextWriteStringMapper.ensureInitialized();
      FileOpContextDeleteMapper.ensureInitialized();
      FileOpContextReadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContext';

  static String _$path(FileOpContext v) => v.path;
  static const Field<FileOpContext, String> _f$path = Field('path', _$path);

  @override
  final MappableFields<FileOpContext> fields = const {
    #path: _f$path,
  };

  static FileOpContext _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'FileOpContext', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContext fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContext>(map);
  }

  static FileOpContext fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContext>(json);
  }
}

mixin FileOpContextMappable {
  String toJson();
  Map<String, dynamic> toMap();
  FileOpContextCopyWith<FileOpContext, FileOpContext, FileOpContext>
      get copyWith;
}

abstract class FileOpContextCopyWith<$R, $In extends FileOpContext, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? path});
  FileOpContextCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class FileOpContextWriteMapMapper
    extends SubClassMapperBase<FileOpContextWriteMap> {
  FileOpContextWriteMapMapper._();

  static FileOpContextWriteMapMapper? _instance;
  static FileOpContextWriteMapMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileOpContextWriteMapMapper._());
      FileOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContextWriteMap';

  static String _$path(FileOpContextWriteMap v) => v.path;
  static const Field<FileOpContextWriteMap, String> _f$path =
      Field('path', _$path);
  static Map<String, dynamic> _$content(FileOpContextWriteMap v) => v.content;
  static const Field<FileOpContextWriteMap, Map<String, dynamic>> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<FileOpContextWriteMap> fields = const {
    #path: _f$path,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'write_map';
  @override
  late final ClassMapperBase superMapper =
      FileOpContextMapper.ensureInitialized();

  static FileOpContextWriteMap _instantiate(DecodingData data) {
    return FileOpContextWriteMap(
        path: data.dec(_f$path), content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContextWriteMap fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContextWriteMap>(map);
  }

  static FileOpContextWriteMap fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContextWriteMap>(json);
  }
}

mixin FileOpContextWriteMapMappable {
  String toJson() {
    return FileOpContextWriteMapMapper.ensureInitialized()
        .encodeJson<FileOpContextWriteMap>(this as FileOpContextWriteMap);
  }

  Map<String, dynamic> toMap() {
    return FileOpContextWriteMapMapper.ensureInitialized()
        .encodeMap<FileOpContextWriteMap>(this as FileOpContextWriteMap);
  }

  FileOpContextWriteMapCopyWith<FileOpContextWriteMap, FileOpContextWriteMap,
      FileOpContextWriteMap> get copyWith => _FileOpContextWriteMapCopyWithImpl<
          FileOpContextWriteMap, FileOpContextWriteMap>(
      this as FileOpContextWriteMap, $identity, $identity);
  @override
  String toString() {
    return FileOpContextWriteMapMapper.ensureInitialized()
        .stringifyValue(this as FileOpContextWriteMap);
  }

  @override
  bool operator ==(Object other) {
    return FileOpContextWriteMapMapper.ensureInitialized()
        .equalsValue(this as FileOpContextWriteMap, other);
  }

  @override
  int get hashCode {
    return FileOpContextWriteMapMapper.ensureInitialized()
        .hashValue(this as FileOpContextWriteMap);
  }
}

extension FileOpContextWriteMapValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileOpContextWriteMap, $Out> {
  FileOpContextWriteMapCopyWith<$R, FileOpContextWriteMap, $Out>
      get $asFileOpContextWriteMap => $base.as(
          (v, t, t2) => _FileOpContextWriteMapCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileOpContextWriteMapCopyWith<
    $R,
    $In extends FileOpContextWriteMap,
    $Out> implements FileOpContextCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get content;
  @override
  $R call({String? path, Map<String, dynamic>? content});
  FileOpContextWriteMapCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FileOpContextWriteMapCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileOpContextWriteMap, $Out>
    implements FileOpContextWriteMapCopyWith<$R, FileOpContextWriteMap, $Out> {
  _FileOpContextWriteMapCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileOpContextWriteMap> $mapper =
      FileOpContextWriteMapMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get content => MapCopyWith($value.content,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(content: v));
  @override
  $R call({String? path, Map<String, dynamic>? content}) =>
      $apply(FieldCopyWithData({
        if (path != null) #path: path,
        if (content != null) #content: content
      }));
  @override
  FileOpContextWriteMap $make(CopyWithData data) => FileOpContextWriteMap(
      path: data.get(#path, or: $value.path),
      content: data.get(#content, or: $value.content));

  @override
  FileOpContextWriteMapCopyWith<$R2, FileOpContextWriteMap, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FileOpContextWriteMapCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileOpContextWriteStringMapper
    extends SubClassMapperBase<FileOpContextWriteString> {
  FileOpContextWriteStringMapper._();

  static FileOpContextWriteStringMapper? _instance;
  static FileOpContextWriteStringMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = FileOpContextWriteStringMapper._());
      FileOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContextWriteString';

  static String _$path(FileOpContextWriteString v) => v.path;
  static const Field<FileOpContextWriteString, String> _f$path =
      Field('path', _$path);
  static String _$content(FileOpContextWriteString v) => v.content;
  static const Field<FileOpContextWriteString, String> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<FileOpContextWriteString> fields = const {
    #path: _f$path,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'write_string';
  @override
  late final ClassMapperBase superMapper =
      FileOpContextMapper.ensureInitialized();

  static FileOpContextWriteString _instantiate(DecodingData data) {
    return FileOpContextWriteString(
        path: data.dec(_f$path), content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContextWriteString fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContextWriteString>(map);
  }

  static FileOpContextWriteString fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContextWriteString>(json);
  }
}

mixin FileOpContextWriteStringMappable {
  String toJson() {
    return FileOpContextWriteStringMapper.ensureInitialized()
        .encodeJson<FileOpContextWriteString>(this as FileOpContextWriteString);
  }

  Map<String, dynamic> toMap() {
    return FileOpContextWriteStringMapper.ensureInitialized()
        .encodeMap<FileOpContextWriteString>(this as FileOpContextWriteString);
  }

  FileOpContextWriteStringCopyWith<FileOpContextWriteString,
          FileOpContextWriteString, FileOpContextWriteString>
      get copyWith => _FileOpContextWriteStringCopyWithImpl<
              FileOpContextWriteString, FileOpContextWriteString>(
          this as FileOpContextWriteString, $identity, $identity);
  @override
  String toString() {
    return FileOpContextWriteStringMapper.ensureInitialized()
        .stringifyValue(this as FileOpContextWriteString);
  }

  @override
  bool operator ==(Object other) {
    return FileOpContextWriteStringMapper.ensureInitialized()
        .equalsValue(this as FileOpContextWriteString, other);
  }

  @override
  int get hashCode {
    return FileOpContextWriteStringMapper.ensureInitialized()
        .hashValue(this as FileOpContextWriteString);
  }
}

extension FileOpContextWriteStringValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileOpContextWriteString, $Out> {
  FileOpContextWriteStringCopyWith<$R, FileOpContextWriteString, $Out>
      get $asFileOpContextWriteString => $base.as((v, t, t2) =>
          _FileOpContextWriteStringCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileOpContextWriteStringCopyWith<
    $R,
    $In extends FileOpContextWriteString,
    $Out> implements FileOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path, String? content});
  FileOpContextWriteStringCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FileOpContextWriteStringCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileOpContextWriteString, $Out>
    implements
        FileOpContextWriteStringCopyWith<$R, FileOpContextWriteString, $Out> {
  _FileOpContextWriteStringCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileOpContextWriteString> $mapper =
      FileOpContextWriteStringMapper.ensureInitialized();
  @override
  $R call({String? path, String? content}) => $apply(FieldCopyWithData(
      {if (path != null) #path: path, if (content != null) #content: content}));
  @override
  FileOpContextWriteString $make(CopyWithData data) => FileOpContextWriteString(
      path: data.get(#path, or: $value.path),
      content: data.get(#content, or: $value.content));

  @override
  FileOpContextWriteStringCopyWith<$R2, FileOpContextWriteString, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FileOpContextWriteStringCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileOpContextDeleteMapper
    extends SubClassMapperBase<FileOpContextDelete> {
  FileOpContextDeleteMapper._();

  static FileOpContextDeleteMapper? _instance;
  static FileOpContextDeleteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileOpContextDeleteMapper._());
      FileOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContextDelete';

  static String _$path(FileOpContextDelete v) => v.path;
  static const Field<FileOpContextDelete, String> _f$path =
      Field('path', _$path);

  @override
  final MappableFields<FileOpContextDelete> fields = const {
    #path: _f$path,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'delete';
  @override
  late final ClassMapperBase superMapper =
      FileOpContextMapper.ensureInitialized();

  static FileOpContextDelete _instantiate(DecodingData data) {
    return FileOpContextDelete(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContextDelete fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContextDelete>(map);
  }

  static FileOpContextDelete fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContextDelete>(json);
  }
}

mixin FileOpContextDeleteMappable {
  String toJson() {
    return FileOpContextDeleteMapper.ensureInitialized()
        .encodeJson<FileOpContextDelete>(this as FileOpContextDelete);
  }

  Map<String, dynamic> toMap() {
    return FileOpContextDeleteMapper.ensureInitialized()
        .encodeMap<FileOpContextDelete>(this as FileOpContextDelete);
  }

  FileOpContextDeleteCopyWith<FileOpContextDelete, FileOpContextDelete,
      FileOpContextDelete> get copyWith => _FileOpContextDeleteCopyWithImpl<
          FileOpContextDelete, FileOpContextDelete>(
      this as FileOpContextDelete, $identity, $identity);
  @override
  String toString() {
    return FileOpContextDeleteMapper.ensureInitialized()
        .stringifyValue(this as FileOpContextDelete);
  }

  @override
  bool operator ==(Object other) {
    return FileOpContextDeleteMapper.ensureInitialized()
        .equalsValue(this as FileOpContextDelete, other);
  }

  @override
  int get hashCode {
    return FileOpContextDeleteMapper.ensureInitialized()
        .hashValue(this as FileOpContextDelete);
  }
}

extension FileOpContextDeleteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileOpContextDelete, $Out> {
  FileOpContextDeleteCopyWith<$R, FileOpContextDelete, $Out>
      get $asFileOpContextDelete => $base.as(
          (v, t, t2) => _FileOpContextDeleteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileOpContextDeleteCopyWith<$R, $In extends FileOpContextDelete,
    $Out> implements FileOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  FileOpContextDeleteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FileOpContextDeleteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileOpContextDelete, $Out>
    implements FileOpContextDeleteCopyWith<$R, FileOpContextDelete, $Out> {
  _FileOpContextDeleteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileOpContextDelete> $mapper =
      FileOpContextDeleteMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  FileOpContextDelete $make(CopyWithData data) =>
      FileOpContextDelete(path: data.get(#path, or: $value.path));

  @override
  FileOpContextDeleteCopyWith<$R2, FileOpContextDelete, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _FileOpContextDeleteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class FileOpContextReadMapper extends SubClassMapperBase<FileOpContextRead> {
  FileOpContextReadMapper._();

  static FileOpContextReadMapper? _instance;
  static FileOpContextReadMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileOpContextReadMapper._());
      FileOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContextRead';

  static String _$path(FileOpContextRead v) => v.path;
  static const Field<FileOpContextRead, String> _f$path = Field('path', _$path);

  @override
  final MappableFields<FileOpContextRead> fields = const {
    #path: _f$path,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'read';
  @override
  late final ClassMapperBase superMapper =
      FileOpContextMapper.ensureInitialized();

  static FileOpContextRead _instantiate(DecodingData data) {
    return FileOpContextRead(path: data.dec(_f$path));
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContextRead fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContextRead>(map);
  }

  static FileOpContextRead fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContextRead>(json);
  }
}

mixin FileOpContextReadMappable {
  String toJson() {
    return FileOpContextReadMapper.ensureInitialized()
        .encodeJson<FileOpContextRead>(this as FileOpContextRead);
  }

  Map<String, dynamic> toMap() {
    return FileOpContextReadMapper.ensureInitialized()
        .encodeMap<FileOpContextRead>(this as FileOpContextRead);
  }

  FileOpContextReadCopyWith<FileOpContextRead, FileOpContextRead,
          FileOpContextRead>
      get copyWith =>
          _FileOpContextReadCopyWithImpl<FileOpContextRead, FileOpContextRead>(
              this as FileOpContextRead, $identity, $identity);
  @override
  String toString() {
    return FileOpContextReadMapper.ensureInitialized()
        .stringifyValue(this as FileOpContextRead);
  }

  @override
  bool operator ==(Object other) {
    return FileOpContextReadMapper.ensureInitialized()
        .equalsValue(this as FileOpContextRead, other);
  }

  @override
  int get hashCode {
    return FileOpContextReadMapper.ensureInitialized()
        .hashValue(this as FileOpContextRead);
  }
}

extension FileOpContextReadValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileOpContextRead, $Out> {
  FileOpContextReadCopyWith<$R, FileOpContextRead, $Out>
      get $asFileOpContextRead => $base
          .as((v, t, t2) => _FileOpContextReadCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileOpContextReadCopyWith<$R, $In extends FileOpContextRead,
    $Out> implements FileOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path});
  FileOpContextReadCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FileOpContextReadCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileOpContextRead, $Out>
    implements FileOpContextReadCopyWith<$R, FileOpContextRead, $Out> {
  _FileOpContextReadCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileOpContextRead> $mapper =
      FileOpContextReadMapper.ensureInitialized();
  @override
  $R call({String? path}) =>
      $apply(FieldCopyWithData({if (path != null) #path: path}));
  @override
  FileOpContextRead $make(CopyWithData data) =>
      FileOpContextRead(path: data.get(#path, or: $value.path));

  @override
  FileOpContextReadCopyWith<$R2, FileOpContextRead, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FileOpContextReadCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

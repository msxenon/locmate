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
      FileOpContextWriteMapper.ensureInitialized();
      FileOpContextDeleteMapper.ensureInitialized();
      FileOpContextReadMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContext';

  @override
  final MappableFields<FileOpContext> fields = const {};

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
  $R call();
  FileOpContextCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class FileOpContextWriteMapper extends SubClassMapperBase<FileOpContextWrite> {
  FileOpContextWriteMapper._();

  static FileOpContextWriteMapper? _instance;
  static FileOpContextWriteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileOpContextWriteMapper._());
      FileOpContextMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'FileOpContextWrite';

  static String _$path(FileOpContextWrite v) => v.path;
  static const Field<FileOpContextWrite, String> _f$path =
      Field('path', _$path);
  static String _$content(FileOpContextWrite v) => v.content;
  static const Field<FileOpContextWrite, String> _f$content =
      Field('content', _$content);

  @override
  final MappableFields<FileOpContextWrite> fields = const {
    #path: _f$path,
    #content: _f$content,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'write';
  @override
  late final ClassMapperBase superMapper =
      FileOpContextMapper.ensureInitialized();

  static FileOpContextWrite _instantiate(DecodingData data) {
    return FileOpContextWrite(
        path: data.dec(_f$path), content: data.dec(_f$content));
  }

  @override
  final Function instantiate = _instantiate;

  static FileOpContextWrite fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<FileOpContextWrite>(map);
  }

  static FileOpContextWrite fromJson(String json) {
    return ensureInitialized().decodeJson<FileOpContextWrite>(json);
  }
}

mixin FileOpContextWriteMappable {
  String toJson() {
    return FileOpContextWriteMapper.ensureInitialized()
        .encodeJson<FileOpContextWrite>(this as FileOpContextWrite);
  }

  Map<String, dynamic> toMap() {
    return FileOpContextWriteMapper.ensureInitialized()
        .encodeMap<FileOpContextWrite>(this as FileOpContextWrite);
  }

  FileOpContextWriteCopyWith<FileOpContextWrite, FileOpContextWrite,
          FileOpContextWrite>
      get copyWith => _FileOpContextWriteCopyWithImpl<FileOpContextWrite,
          FileOpContextWrite>(this as FileOpContextWrite, $identity, $identity);
  @override
  String toString() {
    return FileOpContextWriteMapper.ensureInitialized()
        .stringifyValue(this as FileOpContextWrite);
  }

  @override
  bool operator ==(Object other) {
    return FileOpContextWriteMapper.ensureInitialized()
        .equalsValue(this as FileOpContextWrite, other);
  }

  @override
  int get hashCode {
    return FileOpContextWriteMapper.ensureInitialized()
        .hashValue(this as FileOpContextWrite);
  }
}

extension FileOpContextWriteValueCopy<$R, $Out>
    on ObjectCopyWith<$R, FileOpContextWrite, $Out> {
  FileOpContextWriteCopyWith<$R, FileOpContextWrite, $Out>
      get $asFileOpContextWrite => $base.as(
          (v, t, t2) => _FileOpContextWriteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileOpContextWriteCopyWith<$R, $In extends FileOpContextWrite,
    $Out> implements FileOpContextCopyWith<$R, $In, $Out> {
  @override
  $R call({String? path, String? content});
  FileOpContextWriteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _FileOpContextWriteCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, FileOpContextWrite, $Out>
    implements FileOpContextWriteCopyWith<$R, FileOpContextWrite, $Out> {
  _FileOpContextWriteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<FileOpContextWrite> $mapper =
      FileOpContextWriteMapper.ensureInitialized();
  @override
  $R call({String? path, String? content}) => $apply(FieldCopyWithData(
      {if (path != null) #path: path, if (content != null) #content: content}));
  @override
  FileOpContextWrite $make(CopyWithData data) => FileOpContextWrite(
      path: data.get(#path, or: $value.path),
      content: data.get(#content, or: $value.content));

  @override
  FileOpContextWriteCopyWith<$R2, FileOpContextWrite, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _FileOpContextWriteCopyWithImpl<$R2, $Out2>($value, $cast, t);
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

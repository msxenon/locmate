import 'package:dart_mappable/dart_mappable.dart';
part 'file_op_context.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class FileOpContext with FileOpContextMappable {
  final String path;
  const FileOpContext({required this.path});
}

@MappableClass(discriminatorValue: 'write_map')
class FileOpContextWriteMap extends FileOpContext
    with FileOpContextWriteMapMappable {
  final Map<String, dynamic> content;
  FileOpContextWriteMap({required super.path, required this.content});
}

@MappableClass(discriminatorValue: 'write_string')
class FileOpContextWriteString extends FileOpContext
    with FileOpContextWriteStringMappable {
  final String content;
  FileOpContextWriteString({required super.path, required this.content});
}

@MappableClass(discriminatorValue: 'delete')
class FileOpContextDelete extends FileOpContext
    with FileOpContextDeleteMappable {
  FileOpContextDelete({required super.path});
}

@MappableClass(discriminatorValue: 'read')
class FileOpContextRead extends FileOpContext with FileOpContextReadMappable {
  FileOpContextRead({required super.path});
}

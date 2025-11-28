import 'package:dart_mappable/dart_mappable.dart';
part 'file_op_context.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class FileOpContext with FileOpContextMappable {}

@MappableClass(discriminatorValue: 'write')
class FileOpContextWrite extends FileOpContext with FileOpContextWriteMappable {
  final String path;
  final String content;

  FileOpContextWrite({required this.path, required this.content});
}

@MappableClass(discriminatorValue: 'delete')
class FileOpContextDelete extends FileOpContext with FileOpContextDeleteMappable {
  final String path;

  FileOpContextDelete({required this.path});
}

@MappableClass(discriminatorValue: 'read')
class FileOpContextRead extends FileOpContext with FileOpContextReadMappable {
  final String path;

  FileOpContextRead({required this.path});
}

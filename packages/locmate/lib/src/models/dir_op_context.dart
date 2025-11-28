import 'package:dart_mappable/dart_mappable.dart';
part 'dir_op_context.mapper.dart';

@MappableClass(discriminatorKey: 'type')
sealed class DirOpContext with DirOpContextMappable {
  const DirOpContext();
}

@MappableClass(discriminatorValue: 'create')
class DirOpContextCreate extends DirOpContext with DirOpContextCreateMappable {
  final String path;

  const DirOpContextCreate({required this.path});
}

@MappableClass(discriminatorValue: 'read')
class DirOpContextRead extends DirOpContext with DirOpContextReadMappable {
  final String path;

  const DirOpContextRead({required this.path});
}

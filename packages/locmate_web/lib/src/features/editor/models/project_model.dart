import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
part 'project_model.mapper.dart';

@MappableClass()
class ProjectModel with ProjectModelMappable {
  final String arbDir;
  final List<String> localesOrder;
  final KeyFormat? keyFormat;
  final String path;
  final String? templateArbFile;

  ProjectModel({
    required this.arbDir,
    required this.localesOrder,
    required this.path,
    required this.keyFormat,
    required this.templateArbFile,
  });
}

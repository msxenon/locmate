import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/features/editor/models/project_model.dart';
part 'home_screen_state.mapper.dart';

@MappableClass()
class HomeScreenState extends ProjectModel with HomeScreenStateMappable {
  final List<String> langs;
  final String branch;
  HomeScreenState({
    required super.arbDir,
    required super.localesOrder,
    required super.path,
    required this.langs,
    required this.branch,
    required super.keyFormat,
    required super.templateArbFile,
  });
}

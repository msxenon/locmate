import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MockProjectDataSource extends Mock implements ProjectDataSource {}

class MockProjectRepository extends Mock implements ProjectRepository {}

class MockProjectManager extends AsyncNotifier<ProjectResponse>
    with Mock
    implements ProjectManager {}

class MockSharedPrefrencesWrapper extends Mock implements SharedPrefrencesWrapper {}

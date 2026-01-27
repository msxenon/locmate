import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/data/models/crud_file_locale_model.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:locmate_web/src/features/editor/ui/add_new_key_page_sheet.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late LanguagesController languagesController;
  late MockProjectManager projectManager;
  late MockSharedPrefrencesWrapper mockSharedPrefrencesWrapper;
  late MockProjectRepository projectRepository;
  late List<ArbFileEntity> arbFileEntities;
  setUp(() async {
    registerFallbackValue(FileOpContextRead(path: ''));
    projectManager = MockProjectManager();
    mockSharedPrefrencesWrapper = MockSharedPrefrencesWrapper();
    when(() => mockSharedPrefrencesWrapper.getString(any()))
        .thenAnswer((_) async => null);
    when(() => mockSharedPrefrencesWrapper.setString(any(), any()))
        .thenAnswer((_) async {});
    projectRepository = MockProjectRepository();
    when(() => projectRepository.saveArbFileContent(any(), any()))
        .thenAnswer((_) async => VoidOpResponse());

    final container = ProviderContainer(overrides: [
      projectManagerProvider.overrideWith(() => projectManager),
      sharedPrefrencesWrapperProvider
          .overrideWith((_) => mockSharedPrefrencesWrapper),
      projectRepositoryProvider.overrideWithValue(projectRepository),
    ]);
    arbFileEntities = [
      ArbFileEntity(
        values: {
          '@@locale': 'en',
          'hello': 'Hello',
        },
        fileName: 'app_en.arb',
      ),
    ];
    container.read(projectManagerProvider.notifier).state = AsyncData(
      ProjectData(
        projectPath: '/test/path',
        locmateSettingsModel: LocmateSettingsModel(
            projectName: '', keyFormat: null, localesOrder: []),
        l10nYaml: L10nYamlModel(arbDir: '', templateArbFile: ''),
        arbFileEntities: arbFileEntities,
      ),
    );
    languagesController = container.read(languagesControllerProvider.notifier);
    await container.read(languagesControllerProvider.future);
  });

  group('addNewKey()', () {
    test('add a new key', () async {
      await languagesController.addNewKey(
        NewKeyData(
            keyName: 'testKey', isPlural: false, description: 'A test key'),
      );

      final content = arbFileEntities.first.values;

      print(content);
      verify(() => projectRepository.saveArbFileContent(
            '/test/path/app_en.arb',
            content,
          )).called(1);
    });
  });
}

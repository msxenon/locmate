import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/data/models/l10n_yaml_model.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/data/repositories/project_repository.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mocks.dart';

void main() {
  late ProviderContainer container;
  late MockProjectDataSource mockProjectDataSource;
  late MockProjectRepository mockProjectRepository;

  setUp(() {
    registerFallbackValue(FileOpContextDelete(path: ''));
    registerFallbackValue(LocmateSettingsModel(
      projectName: 'Demo Project',
      keyFormat: KeyFormat.none,
    ));
    registerFallbackValue(L10nYamlModel(
      arbDir: 'lib/l10n',
      templateArbFile: 'app_en.arb',
    ));
    mockProjectDataSource = MockProjectDataSource();
    mockProjectRepository = MockProjectRepository();
    when(() => mockProjectDataSource.getProjectPath())
        .thenAnswer((_) async => '/fake/path');
    container = ProviderContainer(
      overrides: [
        projectDatasourceProvider.overrideWithValue(mockProjectDataSource),
        projectRepositoryProvider.overrideWithValue(mockProjectRepository),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  test('should return $ProjectEmpty', () async {
    when(() => mockProjectRepository.getLocmateModel())
        .thenAnswer((_) async => null);
    when(() => mockProjectRepository.getL10nModel())
        .thenAnswer((_) async => null);
    final s = await container.read(projectManagerProvider.future);

    expect(
      s,
      ProjectEmpty(
        projectPath: '/fake/path',
      ),
    );
  });

  test('should create new project', () async {
    when(() => mockProjectRepository.getLocmateModel())
        .thenAnswer((_) async => null);
    when(() => mockProjectRepository.getL10nModel())
        .thenAnswer((_) async => null);
    when(() => mockProjectRepository.listArbFiles(any()))
        .thenAnswer((_) async => []);
    when(() => mockProjectRepository.saveLocmateModel(any()))
        .thenAnswer((_) async => []);
    when(() => mockProjectRepository.saveL10nModel(any()))
        .thenAnswer((_) async => []);
    when(() => mockProjectDataSource.fileOp(any()))
        .thenAnswer((_) async => StringOpResponse(response: ''));
    when(() => mockProjectRepository.getProjectPubspec())
        .thenAnswer((_) async => null);
    when(() => mockProjectRepository.saveArbFileContent(any(), any()))
        .thenAnswer((_) async => {});
    await container.read(projectManagerProvider.future);
    await container.read(projectManagerProvider.notifier).createNewProject();

    verify(() => mockProjectRepository.saveL10nModel(
          L10nYamlModel(
            arbDir: 'lib/l10n',
            templateArbFile: 'app_en.arb',
          ),
        )).called(1);

    verify(() => mockProjectRepository.saveArbFileContent(
          'lib/l10n/app_en.arb',
          {'@@locale': 'en'},
        )).called(1);
    verify(
      () => mockProjectRepository.saveLocmateModel(
        LocmateSettingsModel(
          projectName: 'New project',
          keyFormat: KeyFormat.camelCase,
          localesOrder: ['en'],
        ),
      ),
    ).called(1);
  });
}

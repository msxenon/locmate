import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/data/models/crud_file_locale_model.dart';
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
    registerFallbackValue(FileOpContextRead(path: ''));
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

  group('loadString', () {
    setUp(() {
      when(() => mockProjectRepository.getLocmateModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
    });

    Future<List<ArbFileEntity>> runLoadString(
      ProviderContainer c, {
      String projectPath = '/fake/path',
      String arbDir = 'lib/l10n',
      LocmateSettingsModel? locmateModel,
    }) {
      return c.read(projectManagerProvider.notifier).loadString(
            projectPath: projectPath,
            arbDir: arbDir,
            locmateModel: locmateModel,
          );
    }

    test('should not look for lib/l10n/lib/l10n/app_en.arb', () async {
      final arbDir = 'lib/l10n';

      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(arbDir))
          .thenAnswer((_) async => ['lib/l10n/app_en.arb']);
      when(() => mockProjectDataSource
              .fileOp(FileOpContextRead(path: 'lib/l10n/app_en.arb')))
          .thenAnswer(
              (_) async => StringOpResponse(response: '{"@@locale": "en"}'));
      await container.read(projectManagerProvider.future);

      final result =
          await container.read(projectManagerProvider.notifier).loadString(
                projectPath: '',
                arbDir: arbDir,
                locmateModel: null,
              );

      expect(result, [
        ArbFileEntity(
          values: {'@@locale': 'en'},
          fileName: 'lib/l10n/app_en.arb',
        ),
      ]);
    });

    test('returns empty list when no ARB files exist', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any()))
          .thenAnswer((_) async => []);
      await container.read(projectManagerProvider.future);

      final result = await runLoadString(container);

      expect(result, isEmpty);
      verify(() => mockProjectRepository.listArbFiles('/fake/path/lib/l10n'))
          .called(1);
    });

    test('returns ArbFileEntity list when ARB files exist and content is valid',
        () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any())).thenAnswer(
        (_) async => ['app_en.arb', 'app_de.arb'],
      );
      var fileOpCallCount = 0;
      when(() => mockProjectDataSource.fileOp(any())).thenAnswer((_) async {
        fileOpCallCount++;
        if (fileOpCallCount == 1) {
          return StringOpResponse(response: '{"@@locale": "en"}');
        }
        return StringOpResponse(response: '{"@@locale": "de"}');
      });
      await container.read(projectManagerProvider.future);

      final result = await runLoadString(container);

      expect(result.length, 2);
      expect(result[0].fileName, 'app_en.arb');
      expect(result[0].values, {'@@locale': 'en'});
      expect(result[0].locale.toLanguageTag(), 'en');
      expect(result[1].fileName, 'app_de.arb');
      expect(result[1].values, {'@@locale': 'de'});
      expect(result[1].locale.toLanguageTag(), 'de');
      verify(() => mockProjectDataSource.fileOp(any())).called(2);
    });

    test('skips file when fileOp returns non-StringOpResponse', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any()))
          .thenAnswer((_) async => ['app_en.arb']);
      when(() => mockProjectDataSource.fileOp(any()))
          .thenAnswer((_) async => VoidOpResponse());
      await container.read(projectManagerProvider.future);

      final result = await runLoadString(container);

      expect(result, isEmpty);
    });

    test('skips file when ARB content is invalid JSON', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any()))
          .thenAnswer((_) async => ['app_en.arb']);
      when(() => mockProjectDataSource.fileOp(any())).thenAnswer(
        (_) async => StringOpResponse(response: 'not valid json'),
      );
      await container.read(projectManagerProvider.future);

      final result = await runLoadString(container);

      expect(result, isEmpty);
    });

    test('sorts by localesOrder when locmateModel has localesOrder', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any())).thenAnswer(
        (_) async => ['app_en.arb', 'app_de.arb', 'app_fr.arb'],
      );
      var fileOpCallCount = 0;
      when(() => mockProjectDataSource.fileOp(any())).thenAnswer((_) async {
        fileOpCallCount++;
        if (fileOpCallCount == 1) {
          return StringOpResponse(response: '{"@@locale": "en"}');
        }
        if (fileOpCallCount == 2) {
          return StringOpResponse(response: '{"@@locale": "de"}');
        }
        return StringOpResponse(response: '{"@@locale": "fr"}');
      });
      await container.read(projectManagerProvider.future);
      const locmateModel = LocmateSettingsModel(
        projectName: 'Demo',
        keyFormat: KeyFormat.none,
        localesOrder: ['fr', 'de', 'en'],
      );

      final result = await runLoadString(
        container,
        locmateModel: locmateModel,
      );

      expect(result.length, 3);
      expect(result[0].locale.toLanguageTag(), 'fr');
      expect(result[1].locale.toLanguageTag(), 'de');
      expect(result[2].locale.toLanguageTag(), 'en');
    });

    test('does not sort when locmateModel is null', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any())).thenAnswer(
        (_) async => ['app_en.arb', 'app_de.arb'],
      );
      var fileOpCallCount = 0;
      when(() => mockProjectDataSource.fileOp(any())).thenAnswer((_) async {
        fileOpCallCount++;
        if (fileOpCallCount == 1) {
          return StringOpResponse(response: '{"@@locale": "en"}');
        }
        return StringOpResponse(response: '{"@@locale": "de"}');
      });
      await container.read(projectManagerProvider.future);

      final result = await runLoadString(container, locmateModel: null);

      expect(result.length, 2);
      expect(result[0].fileName, 'app_en.arb');
      expect(result[1].fileName, 'app_de.arb');
    });

    test('does not sort when localesOrder is empty', () async {
      when(() => mockProjectRepository.getL10nModel())
          .thenAnswer((_) async => null);
      when(() => mockProjectRepository.listArbFiles(any())).thenAnswer(
        (_) async => ['app_en.arb'],
      );
      when(() => mockProjectDataSource.fileOp(any())).thenAnswer(
        (_) async => StringOpResponse(response: '{"@@locale": "en"}'),
      );
      await container.read(projectManagerProvider.future);
      const locmateModel = LocmateSettingsModel(
        projectName: 'Demo',
        keyFormat: KeyFormat.none,
        localesOrder: [],
      );

      final result = await runLoadString(
        container,
        locmateModel: locmateModel,
      );

      expect(result.length, 1);
      expect(result[0].fileName, 'app_en.arb');
    });
  });
}

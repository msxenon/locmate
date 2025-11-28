// import 'dart:async';
// import 'dart:convert';

// import 'package:locmate/locmate.dart';
// import 'package:locmate_web/src/data/datasources/project_datasource_shared_prefs_impl.dart';

// class ProjectDatasourceSharedPrefsDemoImpl extends ProjectDatasourceSharedPrefsImpl {
//   ProjectDatasourceSharedPrefsDemoImpl(super.sharedPrefrencesWrapper) {
//     final demoLocmateYaml = LocmateSettingsModel(projectName: 'Demo project', keyFormat: KeyFormat.camelCase);
//     final demoL10nYaml = L10nYamlModel(arbDir: '/', templateArbFile: 'app_en.arb');
//     final arbFileEn = 'app_en.arb';
//     final arbFileAr = 'app_ar.arb';
//     final demoProjectResponse = ProjectResponse(
//       locmateYaml: demoLocmateYaml,
//       projectPath: '/sharedPrefs',
//       l10nYaml: demoL10nYaml,
//       arbFiles: [
//         arbFileAr,
//         arbFileEn,
//       ],
//     );
//     unawaited(
//       fileOp(
//         FileOpContextWrite(path: ProjectDatasourceSharedPrefsImpl.projectKey, content: demoProjectResponse.toJson()),
//       ),
//     );
//     unawaited(
//       fileOp(
//         FileOpContextWrite(path: '$arbFileEn', content: jsonEncode({'@@locale': 'en'})),
//       ),
//     );
//     unawaited(
//       fileOp(
//         FileOpContextWrite(path: arbFileAr, content: jsonEncode({'@@locale': 'ar'})),
//       ),
//     );
//   }
// }

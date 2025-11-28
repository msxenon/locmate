// import 'dart:convert';

// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:locmate/locmate.dart';
// import 'package:locmate_web/src/data/models/crud_file_locale_model.dart';
// import 'package:locmate_web/src/data/datasources/project_datasource.dart';

// abstract class LanguageFileRepository {
//   Future<void> addNewKey(String newKey);
//   Future<void> saveValue({required String locale, required String key, required String value});
//   Future<void> addNewLocale(String locale);
//   Future<void> deleteLocale(String locale);
//   Future<void> deleteKeys(List<String> keys);
// }

// class FileRepositoryWeb extends LanguageFileRepository {
//   final Ref ref;
//   final List<ArbFileEntity> arbFiles;

//   FileRepositoryWeb(this.ref, this.arbFiles);

//   @override
//   Future<void> addNewKey(String newKey) async {
//     final ops = _loopArbsWithCallback((arbFile) {
//       final newContent = Map<String, dynamic>.from(arbFile.values)..putIfAbsent(newKey, () => '');
//       return FileOpContextWrite(path: arbFile.path, content: jsonEncode(newContent));
//     });
//     return _sentToApi(ops);
//   }

//   @override
//   Future<void> saveValue({required String locale, required String key, required String value}) async {
//     final ops = _loopArbsWithCallback((arbFile) {
//       final newContent = Map<String, dynamic>.from(arbFile.values)
//         ..update(
//           key,
//           (existingValue) => locale == arbFile.locale.toString() ? value : existingValue,
//           ifAbsent: () => locale == arbFile.locale.toString() ? value : '',
//         );
//       return FileOpContextWrite(path: arbFile.path, content: jsonEncode(newContent));
//     });
//     return _sentToApi(ops);
//   }

//   @override
//   Future<void> addNewLocale(String locale) async {
//     final newFileName = arbFiles.first.createNewFileFromPattern(locale);
//     final path = arbFiles.first.path.replaceAll(arbFiles.first.fileName, newFileName);
//     await ref
//         .read(projectDatasourceProvider)
//         .fileOp(FileOpContextWrite(path: path, content: jsonEncode({'@@locale': locale})));
//   }

//   @override
//   Future<void> deleteLocale(String locale) async {
//     final arbToDelete = arbFiles.firstWhere((arbFile) => arbFile.locale.toString() == locale);

//     return _sentToApi([FileOpContextDelete(path: arbToDelete.path)]);
//   }

//   @override
//   Future<void> deleteKeys(List<String> keys) async {
//     final ops = _loopArbsWithCallback((arbFile) {
//       final newContent = Map<String, dynamic>.from(arbFile.values)..removeWhere((key, value) => keys.contains(key));
//       return FileOpContextWrite(path: arbFile.path, content: jsonEncode(newContent));
//     });
//     return _sentToApi(ops);
//   }

//   Future<void> replaceKey(String oldKey, String newKey) async {
//     final ops = _loopArbsWithCallback((arbFile) {
//       final newContent = Map<String, dynamic>.from(arbFile.values);
//       if (newContent.containsKey(oldKey)) {
//         newContent[newKey] = newContent[oldKey];
//         newContent['@$newKey'] = newContent['@$oldKey'] ?? {};
//         newContent.remove(oldKey);
//         newContent.remove('@$oldKey');
//       } else {
//         newContent.putIfAbsent(newKey, () => '');
//         newContent.putIfAbsent('@$newKey', () => {});
//       }
//       return FileOpContextWrite(path: arbFile.path, content: jsonEncode(newContent));
//     });
//     return _sentToApi(ops);
//   }

//   List<FileOpContext> _loopArbsWithCallback(FileOpContext Function(ArbFileEntity arbFile) callback) {
//     final List<FileOpContext> fileOps = [];
//     for (final arbFile in arbFiles) {
//       fileOps.add(callback(arbFile));
//     }
//     return fileOps;
//   }

//   Future<void> _sentToApi(List<FileOpContext> fileOps) async {
//     await Future.wait([
//       for (final fileOp in fileOps) ref.read(projectDatasourceProvider).fileOp(fileOp),
//     ]);
//   }
// }

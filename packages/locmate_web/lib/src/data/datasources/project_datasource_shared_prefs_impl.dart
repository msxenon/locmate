import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';

class ProjectDatasourceSharedPrefsImpl extends ProjectDataSource {
  final SharedPrefrencesWrapper _sharedPrefrencesWrapper;
  @projectKey
  static const projectKey = 'project';
  ProjectDatasourceSharedPrefsImpl(this._sharedPrefrencesWrapper);

  @override
  Future<OpResponse> fileOp(FileOpContext fileOpContext) async {
    switch (fileOpContext) {
      case FileOpContextWrite fileOpContextWrite:
        await _sharedPrefrencesWrapper.setString(
            fileOpContextWrite.path, fileOpContextWrite.content);
        return VoidOpResponse();
      case FileOpContextRead fileOpContextRead:
        final fileContent =
            (await _sharedPrefrencesWrapper.getString(fileOpContextRead.path));
        return StringOpResponse(response: fileContent ?? '');
      case FileOpContextDelete fileOpContextDelete:
        await _sharedPrefrencesWrapper.remove(fileOpContextDelete.path);
        return VoidOpResponse();
    }
  }

  @override
  Future<String> getProjectPath() async {
    final project = await _sharedPrefrencesWrapper.getString(projectKey);
    if (project == null) {
      return '';
    }

    return project;
  }

  @override
  Future<OpResponse> dirOp(DirOpContext dirOpContext) async {
    switch (dirOpContext) {
      case DirOpContextCreate dirOpContextCreate:
        await _sharedPrefrencesWrapper.setString(dirOpContextCreate.path, '');
        return VoidOpResponse();
      case DirOpContextRead dirOpContextRead:
        final allKeys = await _sharedPrefrencesWrapper.getKeys();
        return ListOpResponse(
            response: allKeys
                .where((element) => element.startsWith(dirOpContextRead.path))
                .toList());
    }
  }

  @override
  Future<StringOpResponse> version() async {
    return StringOpResponse(response: 'shared_prefs_version_1.0.0');
  }
}

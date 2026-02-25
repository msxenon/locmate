import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/env_config.dart';
import 'package:locmate_web/src/core/logger/ui/dio_logger.dart';
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
      case FileOpContextWriteMap():
        await _sharedPrefrencesWrapper.setString(
          fileOpContext.path,
          JsonStringMapper.mapToString(fileOpContext.content),
        );
        return VoidOpResponse();
      case FileOpContextWriteString():
        await _sharedPrefrencesWrapper.setString(
          fileOpContext.path,
          fileOpContext.content,
        );
        return VoidOpResponse();
      case FileOpContextRead fileOpContextRead:
        final fileContent = (await _sharedPrefrencesWrapper.getString(
          fileOpContextRead.path,
        ));
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
              .toList(),
        );
    }
  }

  @override
  Future<StringOpResponse> version() async {
    final dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 2),
        receiveTimeout: Duration(seconds: 2),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    )..interceptors.add(dioLoggerInterceptor);
    final url = EnvConfig.instance.getFullUrl(UrlPaths.version);
    final response = await dio.get(url);
    final jsonDate = jsonDecode(response.data);
    return StringOpResponse(response: jsonDate['version'] as String);
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/env_config.dart';
import 'package:locmate_web/src/data/datasources/project_datasource_server_impl.dart';
import 'package:locmate_web/src/data/datasources/project_datasource_shared_prefs_impl.dart';
import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'project_datasource.g.dart';

@riverpod
ProjectDataSource projectDatasource(Ref ref) {
  switch (EnvConfig.instance.env) {
    case EnvConfigEnum.server:
      return ProjectDatasourceServerImpl();
    case EnvConfigEnum.sharedPrefs:
      return ProjectDatasourceSharedPrefsImpl(
        ref.read(sharedPrefrencesWrapperProvider),
      );
  }
}

abstract class ProjectDataSource {
  Future<OpResponse> fileOp(FileOpContext fileOpContext);
  Future<String> getProjectPath();
  Future<OpResponse> dirOp(DirOpContext dirOpContext);
  Future<StringOpResponse> version();
}

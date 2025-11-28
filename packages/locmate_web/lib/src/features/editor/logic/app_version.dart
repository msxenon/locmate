import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_version.g.dart';

@Riverpod(keepAlive: true)
FutureOr<String> appVersion(Ref ref) async {
  final versionResponse = await ref.read(projectDatasourceProvider).version();
  return versionResponse.response;
}

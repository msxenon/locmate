import 'package:dio/dio.dart';
import 'package:dio_clean_http_response/dio_clean_http_response.dart';
import 'package:locmate/locmate.dart';
import 'package:locmate_web/src/core/logger/ui/dio_logger.dart';
import 'package:locmate_web/src/data/datasources/project_datasource.dart';

class ProjectDatasourceServerImpl extends ProjectDataSource {
  ProjectDatasourceServerImpl();
  final dio = Dio(BaseOptions(
    connectTimeout: Duration(seconds: 2),
    receiveTimeout: Duration(seconds: 2),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  ))
    ..interceptors.add(dioLoggerInterceptor);
  @override
  Future<OpResponse> fileOp(FileOpContext fileOpContext) async {
    final response = await dio
        .post(
          UrlPaths.fileOperation,
          data: fileOpContext.toMap(),
        )
        .fromJson(OpResponseMapper.fromMap);

    return response.fold((l) {
      throw '${l.message()}: ${dio.options.baseUrl}';
    }, (r) {
      return r;
    });
  }

  @override
  Future<String> getProjectPath() async {
    final response = await dio
        .get(UrlPaths.projectPath)
        .fromJson(StringOpResponseMapper.fromMap);

    return response.fold((l) {
      throw '${l.message()}: ${dio.options.baseUrl}';
    }, (r) {
      return r.response;
    });
  }

  @override
  Future<OpResponse> dirOp(DirOpContext dirOpContext) async {
    final response = await dio
        .post(
          UrlPaths.dirOperation,
          data: dirOpContext.toMap(),
        )
        .fromJson(OpResponseMapper.fromMap);

    return response.fold((l) {
      throw '${l.message()}: ${dio.options.baseUrl}';
    }, (r) {
      return r;
    });
  }

  @override
  Future<StringOpResponse> version() {
    return dio.get(UrlPaths.version).fromJson((e) {
      return StringOpResponse(response: '${e['version']}+${e['build_number']}');
    }).then((response) => response.fold((l) {
          throw '${l.message()}: ${dio.options.baseUrl}';
        }, (r) {
          return r;
        }));
  }
}

import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
part 'crud_file_locale_model.mapper.dart';

@MappableClass()
class ArbFileEntity with ArbFileEntityMappable {
  final Map<String, dynamic> values;
  final String fileName;
  final Locale locale;
  ArbFileEntity({
    required this.values,
    required this.fileName,
  }) : locale = Locale(values['@@locale'] as String);
}

extension ArbFileEntityX on ArbFileEntity {
  static const defaultFileNamePattern = '{{locale}}';

  String createNewFileFromPattern(String newLocaleName) {
    return fileName.replaceAll(locale.toString(), newLocaleName);
  }
}

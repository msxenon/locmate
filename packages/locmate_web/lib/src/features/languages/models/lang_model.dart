import 'dart:ui';

import 'package:dart_mappable/dart_mappable.dart';
part 'lang_model.mapper.dart';

@MappableClass()
class LangModel with LangModelMappable {
  final Locale locale;
  final int? langCompletionPercentage;

  LangModel({required this.locale, required this.langCompletionPercentage});
}

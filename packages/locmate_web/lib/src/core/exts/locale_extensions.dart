import 'package:flutter/material.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';

extension LocaleExtensions on Locale {
  String localize(BuildContext context) {
    final langReadableName = LocaleNames.of(context)!.nameOf(toLanguageTag());
    final localeName = toLanguageTag();
    if (langReadableName == localeName) {
      return localeName;
    } else if (langReadableName == null) {
      return localeName;
    } else {
      return '$langReadableName ($localeName)';
    }
  }
}

import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:locmate_web/src/features/languages/models/arb_items.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';

class LanguagesMapper {
  List<LangRowModelBase> call(List<ArbItems> arbFilesContent) {
    final langRowModels = <LangRowModelBase>[];
    for (final arbFileItems in arbFilesContent) {
      final localeValue = arbFileItems.items.firstWhereOrNull((element) => element.key == '@@locale') as KeyValueItem?;
      if (localeValue == null || localeValue.value.isEmpty) {
        continue;
      }
      final locale = Locale(localeValue.value);
      for (final item in arbFileItems.items) {
        if (item.key == '@@locale') {
          continue;
        }
        if (item is KeyValueItem) {
          final relatedLangRowModel = langRowModels.firstWhereOrNull((element) => element.key == item.key);
          if (relatedLangRowModel != null) {
            final index = langRowModels.indexOf(relatedLangRowModel);
            langRowModels[index] = langRowModels[index].copyWith(
              values: {...relatedLangRowModel.values, locale: item.value},
            );
          } else {
            langRowModels.add(
              LangRowModelBase(
                key: item.key,
                values: {locale: item.value},
                body: KeyBody(description: null, placeholders: null),
              ),
            );
          }
        } else if (item is KeyBodyItem) {
          final relatedLangRowModel = langRowModels.firstWhereOrNull((element) => element.key == item.originalKey);

          if (relatedLangRowModel != null) {
            final index = langRowModels.indexOf(relatedLangRowModel);
            langRowModels[index] = langRowModels[index].copyWith(
              body: KeyBody(
                description: item.description,
                placeholders: item.placeholders?.map((e) => KeyPlaceholder(key: e.key, type: e.type)).toList(),
              ),
            );
          } else {
            assert(false, 'KeyBodyItem without KeyValueItem');
          }
        }
      }
    }
    return langRowModels;
  }
}

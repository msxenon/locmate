import 'package:dart_mappable/dart_mappable.dart';
import 'package:locmate_web/src/features/languages/models/lang_model.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
part 'lang_state.mapper.dart';

@MappableClass()
class LangState with LangStateMappable {
  final List<LangRowModel> rows;
  final List<LangRowModel> problems;
  final List<LangRowModel> uncompleted;
  final List<LangRowModel> selected;
  final List<LangModel> orderdLangs;
  final int selectedKeysCount;
  final int allKeysCount;
  final int sortColumnIndex;
  final bool isSortAscending;
  final int overallCompletionPercentage;
  final MainTabs selectedTab;
  final String? focusedKey;
  LangState({
    required this.rows,
    required this.orderdLangs,
    required this.selectedKeysCount,
    required this.allKeysCount,
    required this.selectedTab,
    this.sortColumnIndex = 0,
    this.isSortAscending = false,
    this.overallCompletionPercentage = 0,
    this.focusedKey,
  }) : problems = rows.where((e) => e.warnings != null).toList(),
       uncompleted = rows.where((e) => e.completionPercentage < 100).toList(),
       selected = rows.where((e) => e.isSelected).toList();
}

extension LangStateExt on LangState {
  List<LangRowModel> get getFilteredRows {
    switch (selectedTab) {
      case MainTabs.all:
        return rows;
      case MainTabs.selected:
        return selected;
      case MainTabs.uncompleted:
        return uncompleted;
      case MainTabs.warnings:
        return problems;
    }
  }
}

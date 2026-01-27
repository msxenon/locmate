import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/wolt_modal_sheet_helper.dart';
import 'package:locmate_web/src/features/editor/ui/add_new_lang_page_sheet.dart';
import 'package:locmate_web/src/features/editor/ui/project_settings_page_sheet.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';

class Navigation {
  Future<void> projectSettings(BuildContext context, LocmateSettingsModel? locmateModel) async {
    await WoltModalSheetHelper.show<String>(
      context,
      (context) => [
        ProjectSettingsPageSheet().build(context),
      ],
    );
  }

  Future<String?> addNewLang(
    BuildContext context,
  ) async {
    return await WoltModalSheetHelper.show<String>(
      context,
      (context) => [
        AddNewLangPageSheet().build(context),
      ],
    );
  }
}

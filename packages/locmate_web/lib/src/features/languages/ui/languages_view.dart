import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/features/editor/ui/add_new_key_page_sheet.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/features/languages/ui/data_table_view.dart';
import 'package:locmate_web/src/features/languages/ui/languages_view_toolbar.dart';
import 'package:locmate_web/src/features/languages/ui/no_languages_found.dart';
import 'package:locmate_web/src/features/languages/ui/single_key_focus_view.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/wolt_modal_sheet_helper.dart';

enum LangViewMode {
  dataTable,
  singleKeyFocus,
}

class LangsDataWidget extends ConsumerStatefulWidget {
  const LangsDataWidget(this.projectData, {super.key});
  final ProjectData projectData;

  @override
  ConsumerState<LangsDataWidget> createState() => _LangsDataWidgetState();
}

class _LangsDataWidgetState extends ConsumerState<LangsDataWidget> {
  final _searchController = TextEditingController();
  final _langViewMode = LangViewMode.singleKeyFocus;

  @override
  Widget build(BuildContext context) {
    final provider = languagesControllerProvider;
    final state = ref.watch(provider);
    final controller = ref.read(provider.notifier);

    return state.when(
      data: (data) {
        final langs = data.orderdLangs;
        if (langs.isEmpty) {
          return NoLanguagesFound();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            LanguagesViewToolbar(
              projectData: widget.projectData,
              controller: controller,
              data: data,
              searchController: _searchController,
              onAddNewKey: () => unawaited(_addNewKey(context, ref)),
            ),
            Expanded(
              child: switch (_langViewMode) {
                LangViewMode.dataTable => DataTableViewType(
                    langState: data,
                    controller: controller,
                  ),
                LangViewMode.singleKeyFocus => SingleKeyFocus(
                    langState: data,
                    controller: controller,
                  ),
              },
            ),
          ],
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, _) => error is AsyncError<LangState>
          ? Text(error.error.toString())
          : Text('Error'),
    );
  }

  Future<void> _addNewKey(BuildContext context, WidgetRef ref) async {
    final newKeyData = await WoltModalSheetHelper.show<NewKeyData>(
      context,
      (context) => [AddNewKeyPageSheet().build(context)],
    );
    if (newKeyData != null) {
      ref.read(languagesControllerProvider.notifier).addNewKey(newKeyData);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

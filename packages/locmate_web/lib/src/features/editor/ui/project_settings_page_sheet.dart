import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/nav/navigation.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/paged_selector_interface.dart';
import 'package:locmate_web/src/data/models/key_format.dart';
import 'package:locmate_web/src/features/editor/logic/locmate_settings_model.dart';
import 'package:locmate_web/src/features/editor/logic/project_settings_controller.dart';
import 'package:locmate_web/src/features/editor/ui/home_screen.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';

class ProjectSettingsPageSheet extends PageSheetInterface {
  ProjectSettingsPageSheet();
  @override
  List<Widget> mainContentSliversBuilder(_) {
    return [
      SliverToBoxAdapter(child: _ProjectSettingsWidget()),
    ];
  }

  @override
  int get pageId => 0;

  @override
  String? get pageTitle => null;

  @override
  String get wizardTitle => 'Project Settings';

  @override
  Widget? topBar() {
    return super.topBar()!;
  }

  @override
  Widget? trailingNavBarWidget() {
    return null;
  }
}

class _ProjectSettingsWidget extends ConsumerStatefulWidget {
  const _ProjectSettingsWidget();
  @override
  ConsumerState<_ProjectSettingsWidget> createState() =>
      __ProjectSettingsWidgetState();
}

class __ProjectSettingsWidgetState
    extends ConsumerState<_ProjectSettingsWidget> {
  TextEditingController? _textController;

  @override
  Widget build(BuildContext context) {
    final provider = ref.read(projectSettingsControllerProvider.notifier);

    return AsyncProviderBuilder<LocmateSettingsState>(
      (context, dataState) {
        final langs = dataState.localesOrder.map((e) => Locale(e)).toList();

        _textController ??= TextEditingController(text: dataState.projectName);

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              TextFormField(
                autofocus: true,
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Project name',
                  hintText: dataState.projectName,
                ),
                onChanged: (value) {
                  provider.saveProjectName(value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a project name';
                  }
                  return null;
                },
              ),
              DropdownButton<KeyFormat>(
                items: KeyFormat.values
                    .map((e) => DropdownMenuItem<KeyFormat>(
                          value: e,
                          child: Text(e.name),
                        ))
                    .toList(),
                value: dataState.keyFormat,
                onChanged: (x) {
                  if (x == null) return;
                  provider.saveKeyFormat(x);
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: dataState.selectedLangs.isNotEmpty
                              ? Colors.red
                              : null,
                        ),
                        label: const Text('Delete selected'),
                        icon: Icon(Icons.delete),
                        onPressed: dataState.selectedLangs.isEmpty
                            ? null
                            : () {
                                provider.deleteSelectedLangs();
                              },
                      ),
                    ),
                  ),
                  TextButton.icon(
                    label: const Text('Add a new language'),
                    icon: Icon(Icons.add),
                    onPressed: () {
                      Navigation().addNewLang(context).then((value) {
                        if (value != null && value.isNotEmpty) {
                          ref
                              .read(languagesControllerProvider.notifier)
                              .addLanguage(value);
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 400,
                child: ReorderableListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dataState.localesOrder.length,
                  itemBuilder: (context, index) {
                    final lang = langs[index];
                    return Container(
                      key: ValueKey([index]),
                      child: ListTile(
                        leading: Checkbox(
                            value: dataState.selectedLangs
                                .contains(lang.toLanguageTag()),
                            onChanged: (value) {
                              provider
                                  .toggleLangSelection(lang.toLanguageTag());
                            }),
                        title: Text(langs[index].toLanguageTag()),
                        trailing: Icon(Icons.drag_handle),
                      ),
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                    final item = langs.removeAt(oldIndex);
                    langs.insert(newIndex, item);
                    provider.saveLangsOrder(
                        langs.map((e) => e.toLanguageTag()).toList());
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  provider.save();
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
              SizedBox(height: 8),
            ],
          ),
        );
      },
      provider: projectSettingsControllerProvider,
    );
  }
}

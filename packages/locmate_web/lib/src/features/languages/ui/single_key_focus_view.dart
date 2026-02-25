import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:locmate_web/src/core/exts/locale_extensions.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/features/languages/ui/lang_key_value_input.dart';
import 'package:locmate_web/src/features/languages/ui/percentage_widget.dart';

class SingleKeyFocus extends StatelessWidget {
  final LangState langState;
  final LanguagesController controller;
  const SingleKeyFocus({
    super.key,
    required this.langState,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    final langs = langState.orderdLangs;
    final rows = langState.getFilteredRows;
    final focusedRow =
        rows.firstWhereOrNull((e) => e.key == langState.focusedKey) ??
        rows.firstOrNull;

    if (rows.isEmpty) {
      return Center(child: Text('No keys found'));
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: rows.length,
            itemBuilder: (context, index) {
              final row = rows[index];
              final isFocused = row == focusedRow;
              return ListTile(
                leading: Checkbox(
                  value: row.isSelected,
                  onChanged: (value) {
                    controller.toggleCheckmark(row.key);
                  },
                ),
                title: Text(
                  row.key,
                  style: TextStyle(
                    fontWeight: isFocused ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                selected: isFocused,
                subtitle: Text(row.body.description ?? ''),
                selectedTileColor: Theme.of(
                  context,
                ).colorScheme.primaryContainer.withValues(alpha: 0.2),
                trailing: PercentageWidget(row.completionPercentage),
                onTap: () {
                  controller.setFocusedKeyName(row.key);
                },
              );
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: (focusedRow != null)
              ? SingleChildScrollView(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          spacing: 8,
                          children: [
                            Text(
                              focusedRow.key,
                              style: Theme.of(context).textTheme.titleLarge,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Icon(Icons.copy),
                          ],
                        ),
                        onTap: () {
                          Clipboard.setData(
                            ClipboardData(text: focusedRow.key),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '"${focusedRow.key}" copied to clipboard',
                              ),
                            ),
                          );
                        },
                      ),
                      if (focusedRow.body.description != null)
                        Text(
                          focusedRow.body.description!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ...langs.map((lang) {
                        return Column(
                          spacing: 8,
                          children: [
                            Text(lang.locale.localize(context)),
                            LangKeyValueInput(
                              langRowModel: focusedRow,
                              locale: lang.locale,
                              onSave: (newValue) {
                                controller.saveValue(
                                  focusedLang: lang.locale.toLanguageTag(),
                                  key: focusedRow.key,
                                  value: newValue,
                                );
                              },
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                )
              : Container(),
        ),
      ],
    );
  }
}

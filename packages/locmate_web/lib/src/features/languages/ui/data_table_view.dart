import 'dart:math';

import 'package:collection/collection.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:locmate_web/src/core/exts/locale_extensions.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/features/languages/ui/lang_key_value_input.dart';
import 'package:locmate_web/src/features/languages/ui/percentage_widget.dart';

class _SortIcon extends StatelessWidget {
  final bool ascending;
  final bool active;

  const _SortIcon({required this.ascending, required this.active});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Icon(
      ascending ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
      size: 28,
      color: active ? theme.colorScheme.primary : null,
    );
  }
}

class HoverBuilder extends StatefulWidget {
  const HoverBuilder({super.key, required this.builder});

  final Widget Function(bool) builder;

  @override
  State<HoverBuilder> createState() => _HoverBuilderState();
}

class _HoverBuilderState extends State<HoverBuilder> {
  bool onHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => onHover = true),
      onExit: (_) => setState(() => onHover = false),
      child: widget.builder(onHover),
    );
  }
}

class DataTableViewType extends ConsumerWidget {
  final LangState langState;
  final LanguagesController controller;
  const DataTableViewType({
    super.key,
    required this.langState,
    required this.controller,
  });
  static const double _columnSpacing = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final langs = langState.orderdLangs;
    final rows = langState.getFilteredRows;

    return LayoutBuilder(
      builder: (context, constraints) {
        final colorScheme = theme.colorScheme;
        return DataTable2(
          headingRowColor: WidgetStateColor.resolveWith(
            (states) => colorScheme.surfaceContainerHighest,
          ),
          headingRowDecoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          headingTextStyle: TextStyle(color: colorScheme.onSurfaceVariant),
          headingCheckboxTheme: theme.checkboxTheme,
          datarowCheckboxTheme: theme.checkboxTheme,
          checkboxAlignment: Alignment.centerLeft,
          isHorizontalScrollBarVisible: true,
          isVerticalScrollBarVisible: true,
          columnSpacing: _columnSpacing,
          fixedLeftColumns: 0,
          horizontalMargin: 12,
          sortArrowBuilder: (ascending, sorted) => sorted
              ? Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: _SortIcon(
                        ascending: true,
                        active: sorted && ascending,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: _SortIcon(
                        ascending: false,
                        active: sorted && !ascending,
                      ),
                    ),
                  ],
                )
              : null,
          border: TableBorder(
            top: BorderSide.none,
            bottom: BorderSide.none,
            left: BorderSide.none,
            right: BorderSide.none,
            verticalInside: BorderSide(color: Theme.of(context).dividerColor),
            horizontalInside: BorderSide.none,
          ),
          empty: Center(child: Text('No Keys')),
          bottomMargin: 10,
          sortColumnIndex: langState.sortColumnIndex,
          sortAscending: langState.isSortAscending,
          sortArrowIcon: Icons.keyboard_arrow_up,
          sortArrowAnimationDuration: const Duration(milliseconds: 500),
          onSelectAll: (val) => controller.onSelectAll(val),
          showHeadingCheckBox: true,
          columns: [
            DataColumn2(
              label: Text('Keys'),
              onSort: (columnIndex, ascending) =>
                  controller.sort(SortByKeys(ascending)),
            ),
            ...langs.map((lang) {
              return DataColumn2(
                label: HoverBuilder(
                  builder: (isHovering) {
                    return Row(
                      children: [
                        Text(lang.locale.localize(context)),
                        Spacer(),
                        if (lang.langCompletionPercentage != null &&
                            !isHovering)
                          PercentageWidget(lang.langCompletionPercentage!),
                      ],
                    );
                  },
                ),
                onSort: (columnIndex, ascending) => controller.sort(
                  SortByValues(lang.locale, ascending, columnIndex),
                ),
              );
            }),
          ],
          rows: List<DataRow>.generate(rows.length, (index) {
            final row = rows[index];
            final isLastIndex = index == rows.length - 1;
            return DataRow2(
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.only(
                  bottomLeft: isLastIndex ? Radius.circular(10) : Radius.zero,
                  bottomRight: isLastIndex ? Radius.circular(10) : Radius.zero,
                ),
                border: Border(
                  bottom: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              specificRowHeight: _getRowHeight(
                row,
                langs.map((e) => e.locale).toList(),
                constraints,
                Theme.of(context).textTheme.bodyLarge!,
              ),
              onSelectChanged: (value) {
                controller.toggleCheckmark(row.key);
              },
              selected: row.isSelected,
              cells: [
                DataCell(_KeyCellContent(row: row, controller: controller)),
                ...langs.map((lang) {
                  return DataCell(
                    LangKeyValueInput(
                      langRowModel: row,
                      locale: lang.locale,
                      onSave: (newValue) {
                        controller.saveValue(
                          focusedLang: lang.locale.toLanguageTag(),
                          key: row.key,
                          value: newValue,
                        );
                      },
                    ),
                  );
                }),
              ],
            );
          }),
        );
      },
    );
  }

  double? _getRowHeight(
    LangRowModel row,
    List<Locale> locales,
    BoxConstraints constraints,
    TextStyle textStyle,
  ) {
    final allHeights = <double>[];
    final allAvailableWidth = constraints.maxWidth - 36 - (12 * 3);
    final defaultColumnWidth = allAvailableWidth / (locales.length + 1);
    for (final locale in locales) {
      final hasDoubleSpacing = locale != locales.last;
      final columnSpacingArea = hasDoubleSpacing ? 6 : 0;
      final columnWidth = defaultColumnWidth - columnSpacingArea;
      final value = row.readValue(locale);
      final textSpan = TextSpan(text: value, style: textStyle);
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: value.textDirection(),
        locale: locale,
      );
      textPainter.layout(minWidth: 0, maxWidth: columnWidth);
      allHeights.add(textPainter.height + 24);
    }

    return max(
      allHeights.maxOrNull?.toDouble() ?? kMinInteractiveDimension,
      kMinInteractiveDimension,
    );
  }
}

class _KeyCellContent extends StatelessWidget {
  const _KeyCellContent({required this.row, required this.controller});

  final LangRowModel row;
  final LanguagesController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: row.warnings != null && row.warnings!.isNotEmpty
              ? () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Warnings'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: row.warnings!
                            .map(
                              (e) => ListTile(
                                title: Text(e.runtimeType.toString()),
                                subtitle: (e is TypeCaseKeyWarning)
                                    ? Text(e.suggestedValue)
                                    : null,
                                trailing: TextButton(
                                  onPressed: () {
                                    if (e is TypeCaseKeyWarning) {
                                      controller.replaceKey(
                                        row.key,
                                        e.suggestedValue,
                                      );
                                    }
                                    Navigator.of(context).pop();
                                  },
                                  child: Text('Fix'),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  );
                }
              : null,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: row.warnings != null && row.warnings!.isNotEmpty
                      ? Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.error,
                            width: 2,
                          ),
                        )
                      : null,
                ),
                child: Text(row.key, style: DefaultTextStyle.of(context).style),
              ),
              if (row.body.description != null)
                Text(
                  row.body.description!,
                  style: DefaultTextStyle.of(context).style.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
        Spacer(),
        PercentageWidget(row.completionPercentage),
      ],
    );
  }
}

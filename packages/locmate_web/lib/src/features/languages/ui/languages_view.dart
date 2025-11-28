import 'dart:async';
import 'dart:math';

import 'package:collection/collection.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/exts/locale_extensions.dart';
import 'package:locmate_web/src/core/nav/navigation.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/wolt_modal_sheet_helper.dart';
import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/features/editor/ui/add_new_key_page_sheet.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/provider/arb_parser.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/features/languages/ui/no_languages_found.dart';
import 'package:locmate_web/src/features/languages/ui/percentage_widget.dart';
import 'package:intl/intl.dart' as intl;

class LangsDataWidget extends ConsumerStatefulWidget {
  const LangsDataWidget(this.projectData, {super.key});
  final ProjectData projectData;

  @override
  ConsumerState<LangsDataWidget> createState() => _LangsDataWidgetState();
}

class _LangsDataWidgetState extends ConsumerState<LangsDataWidget> {
  bool showCustomArrow = false;
  bool sortArrowsAlwaysVisible = false;
  final _searchController = TextEditingController();
  final LangViewMode _langViewMode = LangViewMode.singleKeyFocus;
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
        final rows = data.getFilteredRows;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          spacing: 16,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.projectData.locmateSettingsModel?.projectName != null)
                  Text(
                    widget.projectData.locmateSettingsModel!.projectName!,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Navigation().projectSettings(context, widget.projectData.locmateSettingsModel);
                    },
                    icon: Icon(Icons.settings))
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onChanged: (value) => controller.search(value),
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(8),
                      //   borderSide: BorderSide(
                      //     color: Colors.grey.withValues(alpha: 0),
                      //     width: 0.2,
                      //   ),
                      // ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? IconButton(
                              icon: Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                                controller.search('');
                              },
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                CustomSlidingSegmentedControl<MainTabs>(
                  initialValue: data.selectedTab,
                  children: {
                    MainTabs.all: Text('All (${data.allKeysCount})'),
                    MainTabs.uncompleted: Text('Uncompleted (${data.uncompleted.length})'),
                    MainTabs.warnings: Text('Proplems (${data.problems.length})'),
                    MainTabs.selected: Text('Selected (${data.selectedKeysCount})'),
                  },
                  decoration: BoxDecoration(
                    color: Color(0xffF0F0F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  thumbDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .3),
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                        offset: Offset(
                          0.0,
                          2.0,
                        ),
                      ),
                    ],
                  ),
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInToLinear,
                  onValueChanged: (v) {
                    controller.changeTab(v);
                  },
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: rows.any((e) => e.isSelected)
                      ? () {
                          controller.deleteSelectedKeys();
                        }
                      : null,
                  icon: Icon(Icons.delete),
                  label: Text('Delete selected keys'),
                ),
                TextButton.icon(
                  onPressed: () {
                    unawaited(_addNewKey(context, ref));
                  },
                  icon: Icon(Icons.add),
                  label: Text('Add a new key'),
                ),
              ],
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
      error: (error, _) => error is AsyncError<LangState> ? Text(error.error.toString()) : Text('Error'),
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
}

class SingleKeyFocus extends StatelessWidget {
  final LangState langState;
  final LanguagesController controller;
  const SingleKeyFocus({super.key, required this.langState, required this.controller});
  @override
  Widget build(BuildContext context) {
    final langs = langState.orderdLangs;
    final rows = langState.getFilteredRows;
    final focusedRow = rows.firstWhereOrNull((e) => e.key == langState.focusedKey) ?? rows.firstOrNull;

    if (rows.isEmpty) {
      return Center(
        child: Text('No keys found'),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            color: Theme.of(context).colorScheme.onPrimary,
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
                  title: Text(row.key, style: TextStyle(fontWeight: isFocused ? FontWeight.bold : FontWeight.normal)),
                  selected: isFocused,
                  subtitle: Text(row.body.description ?? ''),
                  selectedTileColor: Colors.black.withValues(alpha: 0.1),
                  trailing: PercentageWidget(row.completionPercentage),
                  onTap: () {
                    controller.setFocusedKeyName(row.key);
                  },
                );
              },
            ),
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
                          Clipboard.setData(ClipboardData(text: focusedRow.key));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('"${focusedRow.key}" copied to clipboard'),
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

class LangKeyValueInput extends StatefulWidget {
  const LangKeyValueInput({
    super.key,
    required this.langRowModel,
    required this.onSave,
    required this.locale,
  });
  final ValueChanged<String> onSave;
  final LangRowModel langRowModel;
  final Locale locale;
  @override
  State<LangKeyValueInput> createState() => _LangKeyValueInputState();
}

class _LangKeyValueInputState extends State<LangKeyValueInput> {
  final FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  bool hasUnsavedChanges = false;
  late TextEditingController textController;
  late String initialValue;

  @override
  void initState() {
    super.initState();

    initialValue = widget.langRowModel.readValue(widget.locale);
    textController = TextEditingController(text: initialValue);
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
    });
    textController.addListener(() {
      setState(() {
        hasUnsavedChanges = textController.text != initialValue;
      });
    });
  }

  @override
  void didUpdateWidget(covariant LangKeyValueInput oldWidget) {
    initialValue = widget.langRowModel.readValue(widget.locale);
    textController.text = initialValue;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.langRowModel.isPlural) {
      final pluralContainer = widget.langRowModel.values[widget.locale] as PluralValueContainer;
      return Plurals(
        pluralContainer: pluralContainer,
        widget: widget,
        onSave: (value) {
          widget.onSave(value);
        },
      );
    }

    return DefaultTextInputField(
      value: initialValue,
      onSave: (value) {
        widget.onSave(value);
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }
}

class Plurals extends StatefulWidget {
  const Plurals({
    super.key,
    required this.pluralContainer,
    required this.widget,
    required this.onSave,
  });

  final PluralValueContainer pluralContainer;
  final LangKeyValueInput widget;
  final ValueChanged<String> onSave;

  @override
  State<Plurals> createState() => _PluralsState();
}

class _PluralsState extends State<Plurals> {
  final List<TextEditingController> textControllers = [];

  TextEditingController getTextController(int index, String? value) {
    final cachedController = textControllers.elementAtOrNull(index);
    if (cachedController != null) {
      return cachedController;
    }

    final controller = TextEditingController(text: value);
    textControllers.add(controller);
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 8,
      children: List.generate(widget.pluralContainer.values.length, (index) {
        final pluralCase = widget.pluralContainer.values.keys.elementAt(index);
        final value = widget.pluralContainer.values[pluralCase];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(flex: 1, child: Text(pluralCase.name.capitalizeFirst)),
            Flexible(
              flex: 5,
              child: DefaultTextInputField(
                value: value ?? '',
                onSave: (value) {
                  final pluralContainer = widget.pluralContainer.copyWith(values: {
                    ...widget.pluralContainer.values,
                    pluralCase: value,
                  });
                  widget.onSave(pluralContainer.mapToString()!);
                },
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  void dispose() {
    for (final controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}

class DefaultTextInputField extends StatefulWidget {
  const DefaultTextInputField({required this.value, required this.onSave, super.key});
  final String value;
  final ValueChanged<String> onSave;
  @override
  State<DefaultTextInputField> createState() => _DefaultTextInputFieldState();
}

class _DefaultTextInputFieldState extends State<DefaultTextInputField> {
  final FocusNode focusNode = FocusNode();
  bool hasFocus = false;
  bool hasUnsavedChanges = false;
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();

    textController = TextEditingController(text: widget.value);
    focusNode.addListener(() {
      setState(() {
        hasFocus = focusNode.hasFocus;
      });
      if (!hasFocus && hasUnsavedChanges) {
        widget.onSave(textController.text);
        setState(() {
          hasUnsavedChanges = false;
        });
      }
    });
    textController.addListener(() {
      setState(() {
        hasUnsavedChanges = textController.text != widget.value;
      });
    });
  }

  @override
  void didUpdateWidget(covariant DefaultTextInputField oldWidget) {
    textController.text = widget.value;

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    // final border = OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: BorderSide(
    //     color: hasFocus ? Colors.blue : Colors.grey,
    //     width: 0.2,
    //   ),
    // );
    return Directionality(
      textDirection: widget.value.textDirection(),
      child: TextField(
        focusNode: focusNode,
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        maxLines: null,
        controller: textController,
        scrollPadding: EdgeInsets.zero,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          // enabledBorder: border,
          contentPadding: EdgeInsets.all(12),
          // border: border,
          hint: Text(
            'No value',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          isDense: true,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasUnsavedChanges && !hasFocus) Icon(Icons.unpublished, color: Colors.orange),
              if (hasFocus)
                IconButton(
                  onPressed: () {
                    focusNode.unfocus();
                  },
                  icon: Icon(
                    Icons.check_circle,
                    color: hasUnsavedChanges ? Colors.orange : Colors.green,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }

  TextDirection textDirection(Locale locale) {
    return intl.Bidi.isRtlLanguage(locale.languageCode) ? TextDirection.rtl : TextDirection.ltr;
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }
}

class _SortIcon extends StatelessWidget {
  final bool ascending;
  final bool active;

  const _SortIcon({required this.ascending, required this.active});

  @override
  Widget build(BuildContext context) {
    return Icon(
      ascending ? Icons.arrow_drop_up_rounded : Icons.arrow_drop_down_rounded,
      size: 28,
      color: active ? Colors.cyan : null,
    );
  }
}

class Gestured extends StatefulWidget {
  const Gestured({super.key, required this.builder});

  final Widget Function(bool) builder;

  @override
  State<Gestured> createState() => _GesturedState();
}

class _GesturedState extends State<Gestured> {
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

enum LangViewMode {
  dataTable,
  singleKeyFocus,
}

class DataTableViewType extends ConsumerWidget {
  final LangState langState;
  final LanguagesController controller;
  const DataTableViewType({super.key, required this.langState, required this.controller});
  static const double _columnSpacing = 12;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final langs = langState.orderdLangs;
    final rows = langState.getFilteredRows;

    return LayoutBuilder(builder: (context, constraints) {
      return DataTable2(
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => Color(0xffF3F3F3),
        ),

        headingRowDecoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xffF3F3F3),
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        ),
        headingTextStyle: const TextStyle(color: Color(0xff757575)),
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
          verticalInside: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
          horizontalInside: BorderSide.none,
        ),
        empty: Center(
          child: Text('No Keys'),
        ),
        bottomMargin: 10,
        sortColumnIndex: langState.sortColumnIndex,
        sortAscending: langState.isSortAscending,
        sortArrowIcon: Icons.keyboard_arrow_up, // custom arrow
        sortArrowAnimationDuration: const Duration(milliseconds: 500), // custom animation duration
        onSelectAll: (val) => controller.onSelectAll(val),
        showHeadingCheckBox: true,
        columns: [
          DataColumn2(
            label: Text('Keys'),
            onSort: (columnIndex, ascending) => controller.sort(SortByKeys(ascending)),
          ),
          ...langs.map((lang) {
            return DataColumn2(
              label: Gestured(
                builder: (p0) {
                  return Row(
                    children: [
                      Text(lang.locale.localize(context)),
                      Spacer(),
                      if (lang.langCompletionPercentage != null && !p0)
                        PercentageWidget(lang.langCompletionPercentage!),
                    ],
                  );
                },
              ),
              onSort: (columnIndex, ascending) => controller.sort(SortByValues(lang.locale, ascending, columnIndex)),
            );
          }),
        ],

        rows: List<DataRow>.generate(rows.length, (index) {
          final row = rows[index];
          final isLastIndex = index == rows.length - 1;
          return DataRow2(
            decoration: BoxDecoration(
              color: Colors.white,
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
              DataCell(Row(
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
                                          subtitle: (e is TypeCaseKeyWarning) ? Text(e.suggestedValue) : null,
                                          trailing: TextButton(
                                            onPressed: () {
                                              if (e is TypeCaseKeyWarning) {
                                                controller.replaceKey(row.key, e.suggestedValue);
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
                                      bottom: BorderSide(color: Theme.of(context).colorScheme.error, width: 2),
                                    )
                                  : null),
                          child: Text(
                            row.key,
                            style: DefaultTextStyle.of(context).style,
                          ),
                        ),
                        if (row.body.description != null)
                          Text(
                            row.body.description!,
                            style: DefaultTextStyle.of(context).style.copyWith(color: Colors.grey),
                          ),
                      ],
                    ),
                  ),
                  Spacer(),
                  PercentageWidget(row.completionPercentage)
                ],
              )),
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
    });
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
      // (hasDoubleSpacing ? _columnSpacing : _columnSpacing / 2);
      final columnWidth = defaultColumnWidth - columnSpacingArea;
      final value = row.readValue(locale);
      final textSpan = TextSpan(
        text: value,
        style: textStyle,
      );
      final textPainter = TextPainter(
        text: textSpan,
        textDirection: value.textDirection(),
        locale: locale,
      );
      textPainter.layout(
        minWidth: 0,
        maxWidth: columnWidth,
      );
      allHeights.add(textPainter.height + 24);
    }

    return max(allHeights.maxOrNull?.toDouble() ?? kMinInteractiveDimension, kMinInteractiveDimension);
  }
}

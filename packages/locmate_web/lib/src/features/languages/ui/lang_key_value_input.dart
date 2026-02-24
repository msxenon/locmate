import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';
import 'package:locmate_web/src/features/languages/provider/arb_parser.dart';

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
      final pluralContainer =
          widget.langRowModel.values[widget.locale] as PluralValueContainer;
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
                  final pluralContainer =
                      widget.pluralContainer.copyWith(values: {
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
  const DefaultTextInputField(
      {required this.value, required this.onSave, super.key});
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
          contentPadding: EdgeInsets.all(12),
          hint: Text(
            'No value',
            style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
          ),
          isDense: true,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasUnsavedChanges && !hasFocus)
                Icon(Icons.unpublished, color: Colors.orange),
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
    return intl.Bidi.isRtlLanguage(locale.languageCode)
        ? TextDirection.rtl
        : TextDirection.ltr;
  }

  @override
  void dispose() {
    focusNode.dispose();
    textController.dispose();
    super.dispose();
  }
}

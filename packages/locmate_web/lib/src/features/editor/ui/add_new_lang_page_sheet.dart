import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/paged_selector_interface.dart';

class AddNewLangPageSheet extends PageSheetInterface {
  @override
  List<Widget> mainContentSliversBuilder(BuildContext context) {
    return [
      const SliverToBoxAdapter(child: AddNewLangWidget()),
    ];
  }

  @override
  int get pageId => 0;

  @override
  String? get pageTitle => null;

  @override
  String get wizardTitle => 'Add a new language';

  @override
  Widget? topBar() {
    return super.topBar()!;
  }

  @override
  Widget? trailingNavBarWidget() {
    return null;
  }
}

class AddNewLangWidget extends ConsumerStatefulWidget {
  const AddNewLangWidget({super.key});

  @override
  ConsumerState<AddNewLangWidget> createState() => _AddNewLangWidgetState();
}

class _AddNewLangWidgetState extends ConsumerState<AddNewLangWidget> {
  final _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 8,
        children: [
          Form(
            key: _formKey,
            child: TextFormField(
              autofocus: true,
              controller: _textController,
              decoration: const InputDecoration(
                labelText: 'Language locale',
                hintText: 'en-CA',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }

                if (Locale(value).languageCode.isEmpty) {
                  return 'Please enter a valid language code';
                }
                return null;
              },
            ),
          ),
          TextButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.of(context).pop(_textController.text);
              }
            },
            label: Text('Add'),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

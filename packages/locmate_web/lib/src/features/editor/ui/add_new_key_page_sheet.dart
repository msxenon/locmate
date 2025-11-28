import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/paged_selector_interface.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';

class AddNewKeyPageSheet extends PageSheetInterface {
  AddNewKeyPageSheet();
  @override
  List<Widget> mainContentSliversBuilder(BuildContext context) {
    return [
      SliverToBoxAdapter(child: _AddNewKey()),
    ];
  }

  @override
  int get pageId => 0;

  @override
  String? get pageTitle => null;

  @override
  String get wizardTitle => 'Add new key';

  @override
  Widget? topBar() {
    return super.topBar()!;
  }

  @override
  Widget? trailingNavBarWidget() {
    return null;
  }
}

class _AddNewKey extends ConsumerStatefulWidget {
  const _AddNewKey();

  @override
  ConsumerState<_AddNewKey> createState() => _AddNewLangWidgetState();
}

class _AddNewLangWidgetState extends ConsumerState<_AddNewKey> {
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isPlural = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Column(
          spacing: 8,
          children: [
            TextFormField(
              autofocus: true,
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: 'Key*',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                final isValidKey = ref.read(languagesControllerProvider.notifier).isValidKey(value);
                if (!isValidKey) {
                  return 'Key already exists';
                }
                return null;
              },
            ),
            TextFormField(
              autofocus: true,
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description',
              ),
            ),
            CheckboxListTile(
              title: const Text('Is plural?'),
              value: isPlural,
              onChanged: (value) => setState(() => isPlural = value!),
            ),
            TextButton.icon(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.of(context).pop(NewKeyData(
                    keyName: _nameController.text,
                    isPlural: isPlural,
                    description: _descriptionController.text,
                  ));
                }
              },
              label: Text('Add'),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class NewKeyData {
  final String keyName;
  final String description;
  final bool isPlural;

  NewKeyData({
    required this.keyName,
    required this.isPlural,
    required this.description,
  });
}

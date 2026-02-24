import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

import 'package:locmate_web/src/data/models/project_response.dart';
import 'package:locmate_web/src/features/languages/models/lang_state.dart';
import 'package:locmate_web/src/features/languages/provider/languages_controller.dart';
import 'package:locmate_web/src/core/nav/navigation.dart';

class LanguagesViewToolbar extends StatefulWidget {
  const LanguagesViewToolbar({
    super.key,
    required this.projectData,
    required this.controller,
    required this.data,
    required this.searchController,
    required this.onAddNewKey,
  });

  final ProjectData projectData;
  final LanguagesController controller;
  final LangState data;
  final TextEditingController searchController;
  final VoidCallback onAddNewKey;

  @override
  State<LanguagesViewToolbar> createState() => _LanguagesViewToolbarState();
}

class _LanguagesViewToolbarState extends State<LanguagesViewToolbar> {
  @override
  void initState() {
    super.initState();
    widget.searchController.addListener(_onSearchChanged);
  }

  @override
  void didUpdateWidget(covariant LanguagesViewToolbar oldWidget) {
    if (oldWidget.searchController != widget.searchController) {
      oldWidget.searchController.removeListener(_onSearchChanged);
      widget.searchController.addListener(_onSearchChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onSearchChanged() => setState(() {});

  @override
  void dispose() {
    widget.searchController.removeListener(_onSearchChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final controller = widget.controller;
    final projectData = widget.projectData;
    final searchController = widget.searchController;
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
            if (projectData.locmateSettingsModel?.projectName != null)
              Text(
                projectData.locmateSettingsModel!.projectName!,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            Spacer(),
            IconButton(
              onPressed: () {
                final model = projectData.locmateSettingsModel;
                if (model != null) {
                  Navigation().projectSettings(context, model);
                }
              },
              icon: Icon(Icons.settings),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: searchController,
                onChanged: (value) => controller.search(value),
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  suffixIcon: searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            searchController.clear();
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
                MainTabs.uncompleted:
                    Text('Uncompleted (${data.uncompleted.length})'),
                MainTabs.warnings: Text('Problems (${data.problems.length})'),
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
                    offset: Offset(0.0, 2.0),
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
              onPressed: widget.onAddNewKey,
              icon: Icon(Icons.add),
              label: Text('Add a new key'),
            ),
          ],
        ),
      ],
    );
  }
}

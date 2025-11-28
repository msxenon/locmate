import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/measured_size.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/wolt_app_bar.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/presentation/wolt_modal_sheet_back_button.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

abstract mixin class PageSheetInterface {
  int get pageId;

  String? get wizardTitle;

  String? get pageTitle;

  late final ValueNotifier<int> pageIndexNotifier;

  bool get isFirstPage => pageId == 0;

  Color sabGradientColor(BuildContext context) => Colors.transparent;
  final sabHeightNotifier = ValueNotifier<double>(0);
  VoidCallback? onBackPressed;

  List<Widget> mainContentSliversBuilder(BuildContext context);
  List<Widget> _mainContentSliversBuilder(BuildContext context) => [
        ...mainContentSliversBuilder(context),
        SliverToBoxAdapter(
          child: ValueListenableBuilder<double>(
            valueListenable: sabHeightNotifier,
            builder: (context, value, child) {
              return SizedBox(height: value);
            },
          ),
        ),
      ];

  bool forceMaxHeight = false;

  SliverWoltModalSheetPage build(BuildContext context) {
    final topBar = this.topBar();
    final hasTopBar = topBar != null;
    return SliverWoltModalSheetPage(
      id: pageId,
      topBar: topBar,
      isTopBarLayerAlwaysVisible: hasTopBar,
      forceMaxHeight: forceMaxHeight,
      resizeToAvoidBottomInset: true,
      hasTopBarLayer: hasTopBar,
      sabGradientColor: sabGradientColor(context),
      stickyActionBar: _stickyActionBar(context),
      trailingNavBarWidget: trailingNavBarWidget(),
      mainContentSliversBuilder: _mainContentSliversBuilder,
      leadingNavBarWidget: leadingNavBarWidget(),
    );
  }

  Widget? topBar() {
    if (wizardTitle == null) {
      return null;
    }
    return WoltAppBar(
      wizardTitle: wizardTitle!,
      sectionTitle: pageTitle,
      extraPadding: EdgeInsets.only(left: showLeadingNavBar ? 48 : 0),
    );
  }

  bool get showLeadingNavBar => !isFirstPage;

  Widget? leadingNavBarWidget() {
    return showLeadingNavBar
        ? WoltModalSheetBackButton(
            onBackPressed: onBackPressed,
          )
        : null;
  }

  Widget? trailingNavBarWidget() {
    return null;
  }

  Widget? stickyActionBar(BuildContext context) {
    return null;
  }

  MeasuredSize? _stickyActionBar(BuildContext context) {
    Widget? stickyActionBarWidget = stickyActionBar(context);
    if (stickyActionBarWidget == null) {
      return null;
    }
    final topBarHeight = topBar() != null ? 48.0 : 0.0;
    return MeasuredSize(
      onChange: (Size size) {
        sabHeightNotifier.value = size.height + topBarHeight;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minWidth: double.infinity),
          child: stickyActionBarWidget,
        ),
      ),
    );
  }
}

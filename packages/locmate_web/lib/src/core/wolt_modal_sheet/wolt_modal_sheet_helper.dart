import 'dart:math';

import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/wolt_modal_sheet/m_backdrop_blur.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class WoltModalSheetHelper {
  static Future<T?> show<T>(
    BuildContext context,
    WoltModalSheetPageListBuilder builder, {
    ValueNotifier<int>? pageIndexNotifier,
    bool enableDrag = true,
    bool? barrierDismissible,
    ValueGetter<bool>? canPop,
    Widget Function(Widget)? decorator,
  }) {
    return WoltModalSheet.show<T>(
      context: context,
      useSafeArea: false,
      useRootNavigator: true,
      pageIndexNotifier: pageIndexNotifier,
      pageListBuilder: builder,
      modalDecorator: (child) {
        return decorator?.call(child) ?? child;
      },
      pageContentDecorator: (child) {
        return decorator?.call(child) ?? child;
      },
      enableDrag: enableDrag,
      barrierDismissible: barrierDismissible,
      showDragHandle: false,
      modalTypeBuilder: (context) {
        return MWoltModalType();
      },
    );
  }
}

class MWoltModalType extends WoltModalType {
  MWoltModalType()
      : super(
          shapeBorder: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35)),
          ),
          dismissDirection: WoltModalDismissDirection.startToEnd,
          showDragHandle: true,
          closeProgressThreshold: 0.8,
          barrierDismissible: true,
        );
  static const double _breakPoint = 524;

  @override
  String routeLabel(BuildContext context) {
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return localizations.dialogLabel;
  }

  @override
  BoxConstraints layoutModal(Size availableSize) {
    final availableWidth = availableSize.width >= _breakPoint ? _breakPoint : availableSize.width;

    return BoxConstraints(
      minWidth: availableWidth,
      maxWidth: availableWidth,
      minHeight: 20,
      maxHeight: availableSize.height,
    );
  }

  @override
  Offset positionModal(Size availableSize, Size modalContentSize, TextDirection textDirection) {
    final xPos = (availableSize.width - modalContentSize.width) / 2;
    return Offset(xPos, max(0, (availableSize.height / 2) - (modalContentSize.height / 2)));
  }

  WoltModalTypeBuilder get modalTypeBuilder => (_) {
        return WoltModalType.alertDialog();
      };

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return modalTypeBuilder(context).buildTransitions(context, animation, secondaryAnimation, child);
  }

  @override
  Widget decoratePageContent(BuildContext context, Widget child, bool useSafeArea) {
    return super.decoratePageContent(context, MBackdropBlur(child: SafeArea(top: false, child: child)), useSafeArea);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/logger/ui/debug_button.dart';
import 'package:locmate_web/src/core/logger/ui/draggable_area.dart';
import 'package:locmate_web/src/core/nav/app_router.dart';

class DebugWrapper extends ConsumerStatefulWidget {
  final Widget child;
  final bool enabled;
  final AppRouter router;

  const DebugWrapper({super.key, required this.child, required this.enabled, required this.router});

  @override
  ConsumerState<DebugWrapper> createState() => _DebugWrapperState();
}

class _DebugWrapperState extends ConsumerState<DebugWrapper> {
  bool _debugScreenVisible = false;

  Future<void> _onButtonTap(BuildContext context) async {
    setState(() => _debugScreenVisible = true);
    await widget.router.push(LoggerRoute());

    if (mounted) {
      setState(() => _debugScreenVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enabled || _debugScreenVisible) {
      return widget.child;
    }
    return LayoutBuilder(
      builder: (context, cnstr) => DraggableArea(
        size: cnstr.biggest,
        initialAlignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
          top: MediaQuery.viewPaddingOf(context).top + 40,
          bottom: MediaQuery.viewPaddingOf(context).bottom + 70,
        ),
        draggable: DebugScreenButton(
          onTap: () => _onButtonTap(context),
        ),
        child: widget.child,
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class MeasuredSize extends StatefulWidget {
  const MeasuredSize({
    required this.onChange,
    required this.child,
    super.key,
  });

  final Widget child;

  final void Function(Size size) onChange;

  @override
  MyMeasuredSizeState createState() => MyMeasuredSizeState();
}

class MyMeasuredSizeState extends State<MeasuredSize> {
  final widgetKey = GlobalKey();
  Size? oldSize;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) => unawaited(postFrameCallback()));

    return SizedBox(
      key: widgetKey,
      child: widget.child,
    );
  }

  Future<void> postFrameCallback() async {
    try {
      final context = widgetKey.currentContext!;

      _timer?.cancel();
      _timer = Timer(
        const Duration(milliseconds: 100),
        () {
          if (!mounted) return;

          final newSize = context.size;
          if (newSize == null) return;
          if (newSize == Size.zero) return;
          if (oldSize == newSize) return;

          oldSize = newSize;
          widget.onChange(newSize);
        },
      );
    } catch (_) {
      // debugPrint('$e $s');
    }
  }

  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

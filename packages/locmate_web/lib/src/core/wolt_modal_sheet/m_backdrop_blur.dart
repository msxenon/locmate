import 'dart:ui';

import 'package:flutter/material.dart';

class MBackdropBlur extends StatelessWidget {
  final Widget child;

  const MBackdropBlur({super.key, required this.child});
  @override
  Widget build(BuildContext context) {
    final color =
        Theme.of(context).brightness == Brightness.light ? Colors.white : Theme.of(context).colorScheme.surface;
    return ClipRRect(
      child: ColoredBox(
        color: color.withValues(alpha: 0.5),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  color.withValues(alpha: 0.8),
                  color.withValues(alpha: 0.5),
                  color.withValues(alpha: 0),
                  color.withValues(alpha: 0.5),
                ],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

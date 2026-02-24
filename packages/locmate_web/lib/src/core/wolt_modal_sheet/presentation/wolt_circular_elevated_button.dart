import 'package:flutter/material.dart';

class WoltCircularElevatedButton extends StatelessWidget {
  const WoltCircularElevatedButton({
    required this.onPressed,
    required this.icon,
    super.key,
    this.fillColor,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    final color =
        fillColor ??
        Theme.of(context).colorScheme.primary.withValues(alpha: 0.4);

    return RawMaterialButton(
      elevation: 0,
      focusElevation: 0,
      highlightElevation: 0,
      hoverElevation: 0,
      fillColor: color,
      highlightColor: color.withValues(alpha: .1),
      splashColor: color.withValues(alpha: .1),
      constraints: const BoxConstraints.expand(width: 40, height: 40),
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        size: 24,
        color: Theme.of(context).appBarTheme.iconTheme?.color,
      ),
    );
  }
}

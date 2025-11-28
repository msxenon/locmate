import 'package:flutter/material.dart';

class DebugScreenButton extends StatelessWidget implements PreferredSizeWidget {
  const DebugScreenButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Size get preferredSize => const Size(60, 60);

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: Material(
        type: MaterialType.transparency,
        child: Align(
          child: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.black54,
            child: TextButton(
              onPressed: onTap,
              child: FittedBox(
                child: Text(
                  '<Logs>',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

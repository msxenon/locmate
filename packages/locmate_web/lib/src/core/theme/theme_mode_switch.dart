import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:locmate_web/src/core/theme/theme_mode_provider.dart';

class ThemeModeSwitch extends ConsumerWidget {
  const ThemeModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeAsync = ref.watch(themeModeNotifierProvider);
    final themeMode = themeModeAsync.valueOrNull ?? ThemeMode.system;

    IconData icon;
    switch (themeMode) {
      case ThemeMode.light:
        icon = Icons.light_mode;
        break;
      case ThemeMode.dark:
        icon = Icons.dark_mode;
        break;
      case ThemeMode.system:
        icon = Icons.brightness_auto;
        break;
    }

    return PopupMenuButton<ThemeMode>(
      tooltip: 'Theme',
      icon: Icon(icon),
      onSelected: (ThemeMode mode) {
        ref.read(themeModeNotifierProvider.notifier).setThemeMode(mode);
      },
      itemBuilder: (BuildContext context) => [
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.light,
          child: Row(
            children: [
              Icon(Icons.light_mode, size: 20),
              SizedBox(width: 12),
              Text('Light'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.dark,
          child: Row(
            children: [
              Icon(Icons.dark_mode, size: 20),
              SizedBox(width: 12),
              Text('Dark'),
            ],
          ),
        ),
        const PopupMenuItem<ThemeMode>(
          value: ThemeMode.system,
          child: Row(
            children: [
              Icon(Icons.brightness_auto, size: 20),
              SizedBox(width: 12),
              Text('System'),
            ],
          ),
        ),
      ],
    );
  }
}

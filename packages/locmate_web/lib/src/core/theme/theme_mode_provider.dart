import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:locmate_web/src/features/languages/provider/shared_prefrences_wrapper.dart';

part 'theme_mode_provider.g.dart';

const String _themeModeKey = 'locmate_theme_mode';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  Future<ThemeMode> build() async {
    final wrapper = ref.read(sharedPrefrencesWrapperProvider);
    final value = await wrapper.getString(_themeModeKey);
    return ThemeMode.values.firstWhere(
      (e) => e.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final wrapper = ref.read(sharedPrefrencesWrapperProvider);
    await wrapper.setString(_themeModeKey, mode.name);
    ref.invalidateSelf();
  }
}

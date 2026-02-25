import 'package:flutter/material.dart';

class LocmateTheme {
  LocmateTheme._();

  static ThemeData get lightTheme => _buildLightTheme();
  static ThemeData get darkTheme => _buildDarkTheme();

  static ThemeData _buildLightTheme() {
    const defaultBorderSide = BorderSide(color: Colors.grey, width: 1);
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: defaultBorderSide,
    );
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: Colors.grey.withValues(alpha: 0.2),
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 250, 250, 250),
      dividerColor: Colors.grey,
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.blue;
          return Colors.white;
        }),
        side: const BorderSide(color: Colors.grey, width: 1.0),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: defaultBorder,
        focusedBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.red),
        ),
        disabledBorder: defaultBorder.copyWith(
          borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
        ),
        enabledBorder: defaultBorder,
        outlineBorder: defaultBorderSide,
        activeIndicatorBorder: defaultBorderSide,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    const surfaceDark = Color(0xFF121212);
    const surfaceVariant = Color(0xFF1E1E1E);
    const borderDark = Color(0xFF5C5C5C);
    const defaultBorderSide = BorderSide(color: borderDark, width: 1);
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: defaultBorderSide,
    );
    return ThemeData(
      useMaterial3: false,
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: surfaceDark,
      dividerColor: borderDark,
      dividerTheme: DividerThemeData(
        thickness: 1,
        color: Colors.grey.withValues(alpha: 0.3),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return Colors.blue;
          return surfaceVariant;
        }),
        side: const BorderSide(color: borderDark, width: 1.0),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: defaultBorder,
        focusedBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: defaultBorder.copyWith(
          borderSide: const BorderSide(color: Colors.redAccent),
        ),
        disabledBorder: defaultBorder.copyWith(
          borderSide: BorderSide(color: borderDark.withValues(alpha: 0.5)),
        ),
        enabledBorder: defaultBorder,
        outlineBorder: defaultBorderSide,
        activeIndicatorBorder: defaultBorderSide,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
      ),
    );
  }
}

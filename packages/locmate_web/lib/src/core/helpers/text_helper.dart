import 'package:flutter/material.dart';
import 'package:locmate_web/src/features/languages/models/lang_row_model.dart';

class TextHelper {
  static Size size(
    String text,
    TextStyle style, {
    double? width,
    double? height,
  }) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: text.textDirection(),
    );
    textPainter.layout(maxWidth: width ?? double.infinity);

    return textPainter.size;
  }
}

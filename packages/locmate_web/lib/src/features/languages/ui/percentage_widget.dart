import 'package:flutter/material.dart';
import 'package:locmate_web/src/core/helpers/text_helper.dart';

class PercentageWidget extends StatelessWidget {
  final int percentage;

  const PercentageWidget(this.percentage, {super.key});
  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(percentage.toDouble());
    final style = DefaultTextStyle.of(context).style.copyWith(color: color);
    final size = TextHelper.size('100%', style);
    return Container(
      width: size.width + 4,
      height: size.height + 4,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 222),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text('$percentage%', style: TextStyle(color: color)),
      ),
    );
  }

  Color _getStatusColor(double percentage) {
    if (percentage < 0 || percentage > 100) {
      throw ArgumentError("Percentage must be between 0 and 100.");
    }

    const Color red = Colors.red;
    const Color yellow = Color.fromARGB(255, 185, 157, 0);

    if (percentage <= 50) {
      return Color.lerp(red, yellow, percentage / 50)!;
    } else {
      if (percentage == 100) {
        return Colors.green;
      }
      return Color.lerp(yellow, Colors.brown, (percentage - 50) / 50)!;
    }
  }
}

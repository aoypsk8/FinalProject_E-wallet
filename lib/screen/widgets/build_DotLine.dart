import 'package:dotted_line/dotted_line.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';

class buildDotLine extends StatelessWidget {
  const buildDotLine({
    super.key,
    this.color = color_bbb,
    this.dashlenght = 10,
  });
  final Color color;
  final double dashlenght;

  @override
  Widget build(BuildContext context) {
    return DottedLine(
        lineLength: double.infinity,
        lineThickness: 1,
        dashLength: dashlenght,
        dashColor: color);
  }
}

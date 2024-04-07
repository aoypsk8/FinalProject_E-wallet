import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFont extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final int maxLines;
  final double letterSpacing;
  final TextAlign textAlign;
  const TextFont({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 12.5,
    this.textAlign = TextAlign.left,
    this.fontWeight = FontWeight.normal,
    this.letterSpacing = 0.0,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.notoSansLao(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        // letterSpacing: letterSpacing,
      ),
      textScaleFactor: 1.0,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    ).tr();
  }
}

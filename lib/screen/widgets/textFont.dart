import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

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
    final homeController = Get.find<HomeController>();
    return Text(
      text,
      textAlign: textAlign,
      style: homeController.languageName.value == "lo"
          ? GoogleFonts.notoSansLao(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            )
          : GoogleFonts.poppins(
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
      textScaleFactor: 1.0,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    ).tr();
  }
}

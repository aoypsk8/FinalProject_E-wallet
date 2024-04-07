import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class buildHotMenu extends StatelessWidget {
  final String image;
  final String title;
  const buildHotMenu({
    super.key,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 50.w,
          height: 15.h,
          decoration: BoxDecoration(
            color: color_6fa,
            borderRadius: BorderRadius.circular(7),
          ),
        ),
        TextFont(
          text: title,
          fontWeight: FontWeight.w400,
          color: color_485,
          fontSize: 17,
        ),
      ],
    );
  }
}

import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class build_title extends StatelessWidget {
  final String title;
  const build_title({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 2.w,
          height: 5.h,
          decoration: const BoxDecoration(
              color: color_0a2,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )),
        ),
        const SizedBox(width: 10),
        TextFont(
          text: title,
          fontWeight: FontWeight.w600,
          color: color_0a2,
          fontSize: 17,
        ),
      ],
    );
  }
}

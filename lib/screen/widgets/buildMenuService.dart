import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class buildMenuService extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback func;
  const buildMenuService(
      {super.key,
      required this.image,
      required this.title,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: func,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1, color: color_0a2.withOpacity(0.5)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  image,
                  fit: BoxFit.contain,
                  width: 7.5.w,
                  height: 7.5.w,
                ),
              ),
            ),
          ),
          TextFont(
            text: title,
            fontWeight: FontWeight.w600,
            color: color_485,
            fontSize: 14,
          ),
        ],
      ),
    );
  }
}

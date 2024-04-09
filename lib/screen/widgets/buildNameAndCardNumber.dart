import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildNameAndCardNumber extends StatelessWidget {
  const BuildNameAndCardNumber({
    Key? key,
    this.colors = cr_fff,
  });

  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 13.w,
          height: 13.w,
          padding: const EdgeInsets.all(1.5),
          margin: const EdgeInsets.only(left: 4),
          decoration: BoxDecoration(
              color: color_fff.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image.network(
              'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png',
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFont(
              text: 'AOY PHONGSAKOUN MR',
              fontWeight: FontWeight.w500,
              color: colors,
              fontSize: 15,
            ),
            TextFont(
              text: '1234 - XXXX - XXXX - 5614',
              fontWeight: FontWeight.w500,
              color: colors,
              fontSize: 13,
            ),
          ],
        )
      ],
    );
  }
}

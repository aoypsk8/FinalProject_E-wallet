import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BuildMoreOption extends StatelessWidget {
  const BuildMoreOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        height: 25.w,
        decoration: BoxDecoration(
          color: cr_fff,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: color_6fa,
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(""),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFont(
                      text: 'ວິທີການລົງທະບຽນໃນແອັບ ',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    TextFont(
                      text: 'CopyBank',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    TextFont(
                      text: 'Register',
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

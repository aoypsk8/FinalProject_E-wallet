import 'dart:ffi';

import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Btn extends StatelessWidget {
  final VoidCallback? func;
  final Color color;
  final String text;
  final Color textColor;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Icon? icon;
  final double? textSize;
  const Btn({
    super.key,
    this.func,
    this.color = cr_3c9,
    this.text = 'confirm',
    this.textColor = cr_fff,
    this.borderColor = Colors.black12,
    this.padding = const EdgeInsets.only(left: 15, right: 15, bottom: 15),
    this.icon,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: func,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: borderColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon.isNull
                  ? SizedBox()
                  : Icon(
                      Icons.logout,
                      color: cr_fff,
                      size: 25,
                    ),
              const SizedBox(
                width: 15,
              ),
              TextFont(
                fontSize: textSize ?? 18.0,
                text: text,
                textAlign: TextAlign.center,
                color: textColor,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

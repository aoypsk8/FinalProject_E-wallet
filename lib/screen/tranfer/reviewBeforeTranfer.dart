import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildNameAndCardNumber.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class ReviewBeforeTranfer extends StatefulWidget {
  const ReviewBeforeTranfer({super.key});

  @override
  State<ReviewBeforeTranfer> createState() => _ReviewBeforeTranferState();
}

class _ReviewBeforeTranferState extends State<ReviewBeforeTranfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_2c7,
      appBar: AppBar(
        centerTitle: true,
        title: const TextFont(
          text: "Review ກ່ອນໂອນ",
          color: cr_fff,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: color_fff),
          onPressed: () {
            Get.back();
          },
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -2.00),
              end: Alignment(0, 2),
              colors: [color_394, color_2c7],
            ),
          ),
        ),
      ),
      body: FooterLayout(
        footer: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Btn(
            func: () {
              Get.toNamed("/bill_result");
            },
            textSize: 15,
            color: color_0a2,
            text: "ຖັດໄປ",
            textColor: color_fff,
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black87,
                  ),
                ),
              ),
              child: const Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextFont(
                          text: 'ຕົ້ນທາງ ',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        TextFont(
                          text: 'LAK ( K )',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: color_d41,
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    BuildNameAndCardNumber(
                      colors: color_0a2,
                    ),
                    SizedBox(height: 10),
                    Divider(
                      thickness: sqrt2,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        TextFont(
                          color: color_0a2,
                          text: 'ປາຍທາງ ',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        TextFont(
                          text: 'LAK ( K )',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: color_d41,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    BuildNameAndCardNumber(
                      colors: color_0a2,
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      thickness: sqrt2,
                    ),
                    const SizedBox(height: 10),
                    TextFont(
                      color: color_0a2,
                      text: 'ຈຳນວນເງີນ ',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Row(
                      children: [
                        TextFont(
                          text: '10,000  ',
                          fontSize: 40,
                          color: color_0a2,
                          fontWeight: FontWeight.w500,
                        ),
                        TextFont(
                          text: 'LAK',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: color_d41,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      thickness: sqrt2,
                    ),
                    const SizedBox(height: 10),
                    TextFont(
                      color: color_0a2,
                      text: 'ລາຍລະອຽດ ',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: TextFont(
                        color: color_777,
                        text: 'null ',
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      thickness: sqrt2,
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

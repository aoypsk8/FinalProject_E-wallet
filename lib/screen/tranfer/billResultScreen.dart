// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildNameAndCardNumber.dart';
import 'package:final_flutter_ewallet/screen/widgets/build_DotLine.dart';
import 'package:final_flutter_ewallet/screen/widgets/custom.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class ResultBillScreen extends StatefulWidget {
  const ResultBillScreen({super.key, this.view = false});
  final bool? view;

  @override
  State<ResultBillScreen> createState() => _ResultBillScreenState();
}

class _ResultBillScreenState extends State<ResultBillScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: const Color(0xffD2D3D5),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(158, 102, 169, 227),
                  Color.fromARGB(125, 50, 145, 228),
                ],
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                //water mark
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Opacity(
                    opacity: 0.4,
                    child: SvgPicture.asset(
                      MyIcon.bg_bill,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        buildTextSuccess(),
                        const SizedBox(
                          height: 16,
                        ),
                        ClipPath(
                          clipper: MyCustomClipper(),
                          child: Container(
                            padding: const EdgeInsets.only(top: 40),
                            width: Get.width,
                            height: 30,
                            margin: const EdgeInsets.symmetric(horizontal: 34),
                            decoration: const BoxDecoration(
                              color: color_fff,
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: TriangleClipper(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 34),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(7.0)),
                              color: color_fff,
                            ),
                            width: Get.width,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 150,
                                  color: cr_3c9.withOpacity(0.2),
                                  child: Center(child: Text("LOGO HErE ")),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Column(
                                    children: [
                                      const TextFont(
                                        text: '20230720151240321702 ',
                                        fontSize: 12,
                                        color: color_777,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                TextFont(
                                                  text: 'App Name ',
                                                  fontSize: 14,
                                                  color: color_777,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                TextFont(
                                                  text:
                                                      '20 Jul, 2023    15:12 ',
                                                  fontSize: 12,
                                                  color: color_2d3,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              width: 50,
                                              height: 50,
                                              color: color_777.withOpacity(0.5),
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const buildDotLine(
                                        color: color_ddd,
                                        dashlenght: 12,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const TextFont(
                                              text: 'ລາຍລະອຽດ',
                                              fontSize: 15,
                                              color: color_2d3,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            const TextFont(
                                              text: 'ຈາກບັນຊີ: ',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(height: 15),
                                            const BuildNameAndCardNumber(
                                              colors: color_0a2,
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(
                                              thickness: sqrt2,
                                              color: Colors.black12,
                                            ),
                                            const SizedBox(height: 10),
                                            const TextFont(
                                              color: color_0a2,
                                              text: 'ຫາບັນຊີ: ',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            const SizedBox(height: 15),
                                            const BuildNameAndCardNumber(
                                              colors: color_0a2,
                                            ),
                                            const SizedBox(height: 10),
                                            const Divider(
                                              color: Colors.black12,
                                              thickness: sqrt2,
                                            ),
                                            const SizedBox(height: 10),
                                            buildPaymentAmount(),
                                            const SizedBox(height: 20),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 34),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const TextFont(
                                  text: 'ແບ່ງບັນ',
                                  color: color_2c7,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                                const SizedBox(width: 10),
                                SvgPicture.asset(
                                  MyIcon.ic_share,
                                  fit: BoxFit.cover,
                                  color: color_2c7,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 34),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: ShapeDecoration(
                              color: color_777,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextFont(
                                  text: 'ປິດ',
                                  color: cr_fff,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextSuccess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          MyIcon.ic_check,
          fit: BoxFit.cover,
          width: 6.w,
        ),
        const SizedBox(width: 10),
        const TextFont(
          text: 'ການໂອນເງີນສຳເລັດ',
          fontWeight: FontWeight.w700,
          color: color_2d3,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget buildPaymentAmount() {
    return Container(
      decoration: ShapeDecoration(
        color: color_2c7,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Column(
              children: [
                const TextFont(
                  text: 'ຈຳນວນເງີນ',
                  color: color_fff,
                  fontWeight: FontWeight.w700,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      TextFont(
                        text: "10,000",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: color_fff,
                      ),
                      SizedBox(width: 5),
                      TextFont(
                        text: 'kip',
                        fontWeight: FontWeight.w500,
                        color: color_fff,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

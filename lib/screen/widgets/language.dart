// ignore_for_file: prefer_const_constructors

import 'package:final_flutter_ewallet/controller/homeController.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    return Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: SvgPicture.asset(
                      MyIcon.ic_languange,
                      width: 20.w,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ...homeController.lang.map((e) {
                        return Column(
                          children: [
                            InkWell(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    children: [
                                      Row(children: [
                                        Stack(
                                          children: [
                                            SvgPicture.asset(e.flat!,
                                                width: 8.w),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 16,
                                        ),
                                        e.langId == 'lo'
                                            ? TextFont(text: e.name!)
                                            : TextFont(text: e.name!),
                                        Spacer(),
                                        _iconControl(e.isSelected!)
                                      ]),
                                    ],
                                  ),
                                ),
                                onTap: () =>
                                    homeController.setLocal(e, context)),
                            Divider()
                          ],
                        );
                      })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  _iconControl(bool like) {
    if (like == false) {
      return SizedBox(
        width: 0,
        height: 0,
      );
    } else {
      return Icon(
        Icons.check_rounded,
        color: Color(0xff353b48),
      );
    }
  }
}

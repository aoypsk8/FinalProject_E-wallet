// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class DialogHelper {
  static void showErrorDialog({
    String title = 'something went wrong.',
    String description = 'ການເຊື່ອມຕໍ່ລະບົບມີບັນຫາ, ກະລຸນາລອງໃຫມ່ອີກຄັ້ງ.',
    VoidCallback? onClose,
  }) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper:
                          CustomShape(), // this is my own class which extendsCustomClipper
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffFCD9DB),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 120,
                      ),
                    ),
                    // SvgPicture.asset(
                    //   dialog_warning_red,
                    //   height: 75,
                    // ),
                  ],
                ),
                SizedBox(height: 10),
                TextFont(
                  text: title,
                  fontWeight: FontWeight.bold,
                  color: cr_c29,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFont(
                          text: description,
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Color(0xff636E72),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cr_f2f2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          onPressed: () {
                            hide();
                            if (onClose != null) {
                              onClose();
                            }
                          },
                          child: TextFont(
                              text: 'close',
                              textAlign: TextAlign.center,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void showSuccessDialog(
      {String title = 'Success.',
      String description = 'ດຳເນີນການສຳເລັດ.',
      VoidCallback? onClose}) {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    ClipPath(
                      clipper:
                          CustomShapeOut(), // this is my own class which extendsCustomClipper
                      child: Container(
                        decoration: BoxDecoration(
                            color: cr_rgb104,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        height: 130,
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 10),
                    //   child: SvgPicture.asset(
                    //     dialog_success,
                    //     height: 75,
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 6),
                TextFont(
                  text: title,
                  fontWeight: FontWeight.bold,
                  color: cr_436,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFont(
                          text: description,
                          textAlign: TextAlign.center,
                          maxLines: 5,
                          color: Color(0xff636E72),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: cr_rgb104,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(6), // <-- Radius
                              ),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(vertical: 10)),
                          onPressed: () {
                            hide();
                            if (onClose != null) {
                              onClose();
                            }
                          },
                          child: TextFont(
                            text: 'close',
                            textAlign: TextAlign.center,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void hide() {
    if (Get.isDialogOpen!) Get.back();
  }

  static Future<bool> confirmYseOrNo({
    String title = 'confirm',
    String description = 'question_confirm_logout',
  }) async {
    bool? result = await showDialog<bool>(
      context: Get.overlayContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFont(
                  text: title,
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  height: 25,
                ),
                TextFont(
                  text: description,
                  fontWeight: FontWeight.w300,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () => Get.back(result: false),
                      child: TextFont(
                        text: "ຍົກເລີກ",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    TextButton(
                      onPressed: () => Get.back(result: true),
                      child: TextFont(
                        text: "ຢືນຢັນ",
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return result ?? false;
  }
}

class Loading {
  static void hide() {
    Get.back();
  }

  static void show() {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LoadingAnimationWidget.discreteCircle(
                color: cr_f63,
                size: 90,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    // path.lineTo(0, height - 50);
    // path.quadraticBezierTo(width / 2, height, width, height - 50);
    // path.lineTo(width, 0);
    // path.close();
    path.lineTo(0, height);
    path.quadraticBezierTo(width * 0.5, height - 60, width, height);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomShapeOut extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 30);
    path.quadraticBezierTo(width * 0.5, height + 30, width, height - 30);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

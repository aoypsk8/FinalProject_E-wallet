import 'package:final_flutter_ewallet/screen/nav/homeScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/language.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final LocalAuthentication localAuth = LocalAuthentication();
  final storage = GetStorage();
  bool supportBiometric = false;
  bool? isSwitched = false;

  @override
  void initState() {
    super.initState();
    checkSupportFinger();
    getFinger();
  }

  checkSupportFinger() async {
    bool checkBiometrics = await localAuth.canCheckBiometrics;
    setState(() {
      supportBiometric = checkBiometrics;
    });
  }

  setFinger(bool isFinger) async {
    await storage.write('is_finger', isFinger);
  }

  getFinger() async {
    if (await storage.read('is_finger') != null) {
      isSwitched = storage.read('is_finger');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cr_fff,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 220 * textScaleFactor,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, 0.00),
                  end: Alignment(2, 0),
                  colors: [color_5fa, color_2c7],
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: Opacity(
                      opacity: 0.5,
                      child: SvgPicture.asset(
                        MyIcon.bg_gradient2,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Expanded(
                    child: buidlPhoneName(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Container(
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  shadows: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0,
                      blurRadius: 20,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFont(
                        text: 'ຂໍ້ມູນສ່ວນຕົວ',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: color_777,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextDetail("ຂໍ້ມູນສ່ວນບຸກຄົນ", () {
                        print("object");
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextDetail("ປ່ຽນລະຫັດ PIN Code", () {
                        print("object");
                      }),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextFont(
                        text: 'ຄວາມປອດໄພ',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: color_777,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextFont(
                            text: "Biometric",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: color_2d3,
                          ),
                          Switch(
                            value: isSwitched!,
                            activeColor: color_5fa,
                            inactiveThumbColor: color_5fa,
                            inactiveTrackColor: Colors.black26,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                setFinger(isSwitched!);
                              });
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextFont(
                        text: 'ຊ່ວຍເຫລືອ',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: color_777,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextDetail("ກ່ຽວກັບ ກປບ", () {
                        print("object");
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                      buildTextDetail("ພາສາ", () {
                        if (storage.read('lang_id') != null &&
                            storage.read('lang_flat') != null) {
                          Get.to(() => const Language());
                        }
                      }),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Btn(
              func: () {},
              textSize: 15,
              color: color_eee,
              text: "ອອກຈາກລະບົບ",
              textColor: color_777,
              borderColor: color_eee,
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextDetail(String text, VoidCallback func) {
    return InkWell(
      onTap: func,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFont(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: color_2d3,
          ),
          SvgPicture.asset(
            MyIcon.arrow_right,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  Widget buidlPhoneName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
        const SizedBox(height: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFont(
              text: 'AOY PHONGSAKOUN',
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 15,
            ),
            TextFont(
              text: 'ເລກກະເປົາ: 205xxxx496',
              fontWeight: FontWeight.w400,
              color: color_fff,
              fontSize: 13,
            ),
          ],
        ),
      ],
    );
  }
}

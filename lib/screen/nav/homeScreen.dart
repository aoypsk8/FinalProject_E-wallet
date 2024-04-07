import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildMenuService.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildMoreOption.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildTitle.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:badges/badges.dart' as badges;

import '../widgets/buildHotMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final storage = GetStorage();
final textScaleFactor = Get.mediaQuery.textScaleFactor;

bool showBalance = false;
int _current = 0;

List fakeData = [
  {"image": MyIcon.tranfer, "title": "ໂອນເງິນ"},
  {"image": MyIcon.qr, "title": "ສ້າງ QR"},
  {"image": MyIcon.card_detail, "title": "ລາຍລະອຽດ"},
  {"image": MyIcon.bill_check, "title": "ກວດສອບບີນ"},
  {"image": MyIcon.bill_check, "title": "ກວດສອບບີນ"},
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_f2f2,
      body: Stack(
        children: [
          Container(
            height: 260 * textScaleFactor,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(0.00, -1.00),
                end: Alignment(0, 2),
                colors: [color_2c7, color_2c7],
              ),
            ),
            child: Stack(
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
              ],
            ),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appbarLang(),
                const SizedBox(height: 15),
                buidlPhoneName(),
                const SizedBox(height: 15),
                buildCard(),
                const SizedBox(height: 15),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      scanQR(),
                      const SizedBox(height: 10),
                      const build_title(title: "ການບໍລິການ"),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: Wrap(
                              alignment: WrapAlignment.start,
                              children: List.generate(
                                fakeData.length,
                                (index) => SizedBox(
                                  width: 22.5.w,
                                  child: buildMenuService(
                                    image: fakeData[index]["image"]!,
                                    title: fakeData[index]["title"]!,
                                    func: () {},
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const build_title(title: "ກຳລັງມາແຮງ"),
                      const SizedBox(height: 15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            fakeData.length,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: buildHotMenu(
                                image: "",
                                title: "ແຈກລົດ Jeep ສີແດງ",
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      //advertivment
                      Container(
                        width: double.infinity,
                        height: 13.h,
                        decoration: BoxDecoration(
                          color: color_6fa,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const build_title(title: "ແນະນຳ"),
                      const SizedBox(height: 15),
                      slideAndPoint(),
                      const SizedBox(height: 15),
                      const build_title(title: "ຂໍ້ມູນເພີ່ມເຕີມ"),
                      const SizedBox(height: 15),
                      Column(
                        children: List.generate(
                          3,
                          (index) => BuildMoreOption(),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
          )),
        ],
      ),
    );
  }

  Widget slideAndPoint() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              viewportFraction: 0.8,
              initialPage: 0,
              // padEnds: false,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0,
              scrollDirection: Axis.horizontal,
              height: 150,
              onPageChanged: ((index, reason) {
                setState(() {
                  _current = index;
                });
              })),
          items: fakeData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: color_6fa,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text('text $i'),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            fakeData.length,
            (index) => Container(
              width: index == _current ? 7.5.w : 2.5.w,
              height: 2.5.w,
              margin: const EdgeInsets.only(left: 6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  index == _current ? 100 : 2.5.w,
                ),
                color: index == _current ? color_185 : color_2c7,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget scanQR() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color_2c7,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MyIcon.scan),
            const SizedBox(width: 5),
            const TextFont(
              text: 'ສະແກນຈ່າຍ',
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      height: 175,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(-1.00, 0.00),
          end: Alignment(0, 2),
          colors: [color_0a2, color_185],
        ),
        borderRadius: BorderRadius.all(Radius.circular(9)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.433),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            top: 0,
            child: Image.asset(
              MyIcon.bg_card,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFont(
                      text: 'Current balance :',
                      fontWeight: FontWeight.w300,
                      color: color_fff,
                      fontSize: 13,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextFont(
                              text: showBalance ? '1,000,000' : '*** *** ***',
                              fontWeight: FontWeight.w600,
                              color: color_fff,
                              fontSize: 25,
                            ),
                            const SizedBox(width: 10),
                            const TextFont(
                              text: 'ກີບ',
                              fontWeight: FontWeight.w400,
                              color: color_aea,
                              fontSize: 17,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },
                          child: showBalance == true
                              ? SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    MyIcon.eye,
                                    fit: BoxFit.contain,
                                  ),
                                )
                              : SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: SvgPicture.asset(
                                    MyIcon.close_eye,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                      ],
                    )
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFont(
                      text: '1234 - XXXX - XXXX - 5614 ',
                      fontWeight: FontWeight.w600,
                      color: color_fff,
                      fontSize: 15,
                    ),
                    TextFont(
                      text: 'AOY PHONGSAKOUN',
                      fontWeight: FontWeight.w400,
                      color: color_fff,
                      fontSize: 25,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buidlPhoneName() {
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
                'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png'),
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFont(
              text: 'AOY PHONGSAKOUN',
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 15,
            ),
            TextFont(
              text: '205xxxx496',
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 13,
            ),
          ],
        )
      ],
    );
  }

  Widget appbarLang() {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 10),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              // if (storage.read('lang_id') != null &&
              //     storage.read('lang_flat') != null) {
              //   Get.to(() => Language());
              // }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.20000000298023224),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              child: storage.read('lang_id') == null &&
                      storage.read('lang_flat') == null
                  ? Container(
                      height: 6.w,
                      width: 6.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey[200]),
                    )
                  : Row(
                      children: [
                        SizedBox(
                          height: 6.w,
                          width: 6.w,
                          child: SvgPicture.asset(storage.read('lang_flat')),
                        ),
                        const SizedBox(width: 6),
                        TextFont(
                          text:
                              storage.read('lang_id').toString().toUpperCase(),
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: () {
              // Get.to(() => NotificationBox())
            },
            child: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -14, end: -6),
              badgeStyle: badges.BadgeStyle(
                shape: badges.BadgeShape.circle,
                borderRadius: BorderRadius.circular(30),
                padding: const EdgeInsets.all(5),
                badgeColor: const Color(0xff2ECC71),
              ),
              badgeContent: const TextFont(
                text: '2',
                // text: '128',
                color: Colors.white,
                fontSize: 9,
              ),
              child: SvgPicture.asset(MyIcon.ic_notification, width: 5.w),
            ),
          )
        ],
      ),
    );
  }
}

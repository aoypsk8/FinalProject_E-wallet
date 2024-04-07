import 'package:final_flutter_ewallet/screen/nav/historyScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/homeScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/settingScreen.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int selectedIndex = 0;
  List<Widget> pageList = [];
  @override
  void initState() {
    pageList.add(HomeScreen());
    pageList.add(HistoryScreen());
    pageList.add(SettingScreen());

    super.initState();
  }

  void onItemMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              label: tr('ໜ້າຫລັກ'),
              icon: SvgPicture.asset(
                MyIcon.home,
                color:
                    selectedIndex == 0 ? color_0a2 : color_485.withOpacity(0.4),
              )),
          BottomNavigationBarItem(
              label: tr('ປະຫວັດ'),
              icon: SvgPicture.asset(
                MyIcon.history,
                color:
                    selectedIndex == 1 ? color_0a2 : color_485.withOpacity(0.4),
              )),
          BottomNavigationBarItem(
              label: tr('ຕັ້ງຄ່າ'),
              icon: SvgPicture.asset(
                MyIcon.person,
                color:
                    selectedIndex == 2 ? color_0a2 : color_485.withOpacity(0.4),
              )),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: color_0a2,
        selectedLabelStyle: GoogleFonts.notoSansLao(),
        unselectedLabelStyle: GoogleFonts.notoSansLao(),
        onTap: onItemMenu,
      ),
    );
  }
}

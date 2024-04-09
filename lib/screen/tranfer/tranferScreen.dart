import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildNameAndCardNumber.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildSubCard.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class TranferScreen extends StatefulWidget {
  const TranferScreen({super.key});

  @override
  State<TranferScreen> createState() => _TranferScreenState();
}

class _TranferScreenState extends State<TranferScreen> {
  bool showBalance = false;
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_2c7,
      appBar: AppBar(
        centerTitle: true,
        title: const TextFont(
          text: "ການໂອນເງີນ",
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
        footer: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 2),
              colors: [color_2c7, color_2c7],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Btn(
              func: () {
                Get.toNamed("/detail_tranfer");
              },
              textSize: 15,
              color: color_0a2,
              text: "ຖັດໄປ",
              textColor: color_fff,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black87,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: buildSubCard(
                      showBalance: showBalance,
                      func: () {
                        setState(() {
                          showBalance = !showBalance;
                        });
                      },
                      amount: "1000000",
                      cardNum: "1234 - XXXX - XXXX - 5614 ",
                      name: "AOY PHONGSAKOUN MR",
                    ),
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -2.00),
                          end: Alignment(0, 2),
                          colors: [color_394, color_2c7],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            spreadRadius: 0,
                            blurRadius: 50,
                            offset: Offset(5, 5), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextFont(
                              text: 'ປ້ອນໝາຍເລກ',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: color_fff,
                            ),
                            const SizedBox(height: 10),
                            buildFormField(
                              controller: _numberController,
                              hinText: "205xxxxxxx",
                              fillColor: false,
                            ),
                            const SizedBox(height: 10),
                            const TextFont(
                              text: 'ທຸລະກຳລາສຸດ',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: color_fff,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: List.generate(
                                    10,
                                    (index) => buidlRecent(),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buidlRecent() {
    return Column(
      children: [
        const SizedBox(height: 10),
        BuildNameAndCardNumber(),
        const SizedBox(height: 2),
        Divider(
          thickness: sqrt2,
          color: cr_fff.withOpacity(0.5),
        ),
      ],
    );
  }
}

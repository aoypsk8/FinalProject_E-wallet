import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildNameAndCardNumber.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class DetailTranferScreen extends StatefulWidget {
  const DetailTranferScreen({super.key});

  @override
  State<DetailTranferScreen> createState() => _DetailTranferScreenState();
}

class _DetailTranferScreenState extends State<DetailTranferScreen> {
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
          fontWeight: FontWeight.w500,
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
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 2),
              colors: [color_2c7, color_2c7],
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
              func: () {},
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
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 1,
                    color: Colors.black87,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFont(
                          text: 'ຕົ້ນທາງ',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        BuildNameAndCardNumber(
                          colors: color_0a2,
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFont(
                          text: 'ປາຍທາງ',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        BuildNameAndCardNumber(
                          colors: color_0a2,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
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
}

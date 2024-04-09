import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class buildSubCard extends StatelessWidget {
  const buildSubCard(
      {super.key,
      required this.showBalance,
      required this.func,
      required this.name,
      required this.cardNum,
      required this.amount});

  final bool showBalance;
  final VoidCallback func;
  final String name;
  final String cardNum;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final fn = NumberFormat('#,###', 'en_US');
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        shadows: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildCard(),
          ),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFont(
                      text: name,
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    TextFont(
                      text: cardNum,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            TextFont(
                              text: showBalance
                                  ? fn.format(int.parse(amount))
                                  : '*** *** ***',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                            const SizedBox(width: 10),
                            const TextFont(
                              text: 'kip',
                              fontWeight: FontWeight.w400,
                              color: Colors.black87,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: func,
                          child: showBalance == true
                              ? SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    MyIcon.eye,
                                    fit: BoxFit.contain,
                                    color: Colors.black54,
                                  ),
                                )
                              : SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: SvgPicture.asset(
                                    MyIcon.close_eye,
                                    color: Colors.black54,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget buildCard() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 20.w,
        width: double.infinity,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 0,
              blurRadius: 20,
              offset: Offset(2, 2),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment(-1.00, 0.00),
            end: Alignment(0, 2),
            colors: [color_0a2, color_185],
          ),
          borderRadius: BorderRadius.all(Radius.circular(9)),
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextFont(
                        text: 'balance',
                        fontWeight: FontWeight.w300,
                        color: color_fff,
                        fontSize: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              TextFont(
                                text: '*** *** ***',
                                fontWeight: FontWeight.w600,
                                color: color_fff,
                                fontSize: 10,
                              ),
                              SizedBox(width: 5),
                              TextFont(
                                text: 'kip',
                                fontWeight: FontWeight.w400,
                                color: color_aea,
                                fontSize: 7,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                            height: 10,
                            child: SvgPicture.asset(
                              MyIcon.close_eye,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFont(
                        text: cardNum,
                        fontWeight: FontWeight.w600,
                        color: color_fff,
                        fontSize: 6,
                      ),
                      TextFont(
                        text: name,
                        fontWeight: FontWeight.w400,
                        color: color_fff,
                        fontSize: 9,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

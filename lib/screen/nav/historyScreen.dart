import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/screen/widgets/formatTime.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  List tranferData = [
    {
      "title": "QR Payment",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": true,
      "amount": 1000000
    },
    {
      "title": "Tranfers",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": false,
      "amount": 1000000
    },
    {
      "title": "QR Payment",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": true,
      "amount": 1000000
    },
    {
      "title": "Tranfers",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": false,
      "amount": 10000
    },
    {
      "title": "Tranfers",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": false,
      "amount": 10000
    },
    {
      "title": "QR Payment",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": true,
      "amount": 1000000
    },
    {
      "title": "QR Payment",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": true,
      "amount": 500000
    },
    {
      "title": "Tranfers",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": false,
      "amount": 1000000
    },
    {
      "title": "QR Payment",
      "timeStamp": "1618893581000",
      "transcationID": "MR219465496485152174",
      "recive": true,
      "amount": 1000000
    }
  ];

  final fn = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextFont(
          text: "ປະຫວັດການເຮັດທຸລະກຳ",
          color: cr_fff,
          fontSize: 16,
          fontWeight: FontWeight.w500,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextFont(
                text: "All Transaction",
                color: color_0a2,
                fontSize: 16,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      tranferData.length,
                      (index) => buildCardHis(index),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCardHis(int listIndex) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 3, right: 3),
      child: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: cr_fff,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(4, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: tranferData[listIndex]["recive"] == true
                        ? color_e5f
                        : color_fde,
                    border: Border.all(
                      width: 1,
                      color: color_0a2.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      tranferData[listIndex]["recive"] == true
                          ? MyIcon.cash_in
                          : MyIcon.cash_out,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFont(
                        text: tranferData[listIndex]["title"],
                        color: color_0a2,
                        fontSize: 16,
                      ),
                      TextFont(
                        text: formatTimestamp(
                            tranferData[listIndex]["timeStamp"]),
                        color: color_0a2,
                        fontSize: 11,
                      ),
                      TextFont(
                        text: tranferData[listIndex]["transcationID"],
                        color: color_777,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      tranferData[listIndex]["recive"] == true
                          ? const TextFont(
                              text: "+",
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            )
                          : const TextFont(
                              text: "-",
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                      TextFont(
                        text: fn.format(tranferData[listIndex]["amount"]),
                        color: tranferData[listIndex]["recive"] == true
                            ? Colors.green
                            : Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(width: 5),
                      TextFont(
                        text: "kip",
                        color: tranferData[listIndex]["recive"] == true
                            ? Colors.green
                            : Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

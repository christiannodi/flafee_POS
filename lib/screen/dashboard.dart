import 'package:flafee/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../widget/widget_text.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topTab(),
            Row(
              children: [
                Gap(15),
                totalRevenue(),
                Gap(15),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(30),
                    height: 124,
                    decoration: BoxDecoration(
                      color: AppPallete.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        StatusDasboard(
                          tittle: "On Progress",
                          image: "assets/svg/onprogress.svg",
                          content: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TxtCustom(
                                tittle: "10",
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: AppPallete.black,
                              ),
                              Gap(3),
                              TxtCustom(
                                  tittle: "Orders",
                                  fontSize: 14,
                                  color: AppPallete.greyfont,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 1,
                          color: AppPallete.grey,
                        ),
                        Spacer(),
                        StatusDasboard(
                          tittle: "Performance",
                          image: "assets/svg/performance.svg",
                          content: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TxtCustom(
                                tittle: "Good",
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: AppPallete.black,
                              ),
                              Gap(3),
                              TxtCustom(
                                  tittle: "2/4",
                                  fontSize: 14,
                                  color: AppPallete.greyfont,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 1,
                          color: AppPallete.grey,
                        ),
                        Spacer(),
                        StatusDasboard(
                          tittle: "Today Sales",
                          image: "assets/svg/totalsales.svg",
                          content: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TxtCustom(
                                tittle: "234",
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: AppPallete.black,
                              ),
                              Gap(3),
                              TxtCustom(
                                  tittle: "2/4",
                                  fontSize: 14,
                                  color: AppPallete.greyfont,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 1,
                          color: AppPallete.grey,
                        ),
                        Spacer(),
                        StatusDasboard(
                          tittle: "Today Incomes",
                          image: "assets/svg/todayincome.svg",
                          content: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TxtCustom(
                                tittle: "Rp",
                                fontSize: 10,
                                fontWeight: FontWeight.w900,
                                color: AppPallete.greyfont,
                              ),
                              TxtCustom(
                                  tittle: "552.600",
                                  fontSize: 26,
                                  color: AppPallete.black,
                                  fontWeight: FontWeight.w800),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gap(15),
              ],
            )
          ],
        ),
      ),
    );
  }

  Container totalRevenue() {
    return Container(
      padding: EdgeInsets.all(30),
      height: 124,
      width: 300,
      decoration: BoxDecoration(
        color: AppPallete.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/svg/revenue.svg",
                height: 20,
                color: AppPallete.main,
              ),
              Gap(10),
              TxtCustom(
                  tittle: "Total Revenue",
                  fontSize: 14,
                  color: AppPallete.black,
                  fontWeight: FontWeight.bold),
              Spacer(),
              TxtCustom(
                  tittle: "Details",
                  fontSize: 14,
                  color: AppPallete.greyfont,
                  fontWeight: FontWeight.w600),
            ],
          ),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TxtCustom(
                tittle: "Rp",
                fontSize: 10,
                fontWeight: FontWeight.w900,
                color: AppPallete.greyfont,
              ),
              TxtCustom(
                  tittle: "41.252.000",
                  fontSize: 26,
                  color: AppPallete.black,
                  fontWeight: FontWeight.w900),
            ],
          ),
        ],
      ),
    );
  }

  Padding topTab() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TxtCustom(
              tittle: "Flaafee",
              color: AppPallete.black,
              fontSize: 48,
              fontWeight: FontWeight.w800),
          Gap(15),
          Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 40,
              decoration: BoxDecoration(
                  color: AppPallete.white,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svg/calendar.svg",
                      height: 18,
                      color: AppPallete.main,
                    ),
                    Gap(5),
                    TxtCustom(
                        tittle: getToday(),
                        fontSize: 14,
                        color: AppPallete.main,
                        fontWeight: FontWeight.bold),
                  ],
                ),
              )),
          Spacer(),
          TxtCustom(
              tittle: "Orders: 20",
              fontSize: 14,
              color: AppPallete.black,
              fontWeight: FontWeight.bold),
          InkWell(
            onTap: () {
              // Navigate to notification page
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/svg/report.svg",
                    height: 20,
                    color: AppPallete.black,
                  ),
                  Gap(5),
                  TxtCustom(
                      tittle: "Report",
                      fontSize: 14,
                      color: AppPallete.black,
                      fontWeight: FontWeight.bold),
                ],
              ),
            ),
          ),
          Gap(10),
          Container(
            padding: EdgeInsets.all(16),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppPallete.white,
                borderRadius: BorderRadius.circular(25)),
            child: SvgPicture.asset(
              "assets/svg/notification.svg",
              fit: BoxFit.fitWidth,
              color: AppPallete.main,
            ),
          ),
          Gap(15),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  color: AppPallete.white,
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                children: [
                  Gap(5),
                  Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: AppPallete.black,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Icon(
                        Icons.person,
                      )),
                  Gap(5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TxtCustom(
                          tittle: "Susi Semilikiti",
                          fontSize: 16,
                          color: AppPallete.main,
                          fontWeight: FontWeight.bold),
                      TxtCustom(
                          tittle: "Cashier",
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    ],
                  ),
                  Gap(20),
                ],
              )),
        ],
      ),
    );
  }

  String getToday() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM');
    return formatter.format(now);
  }
}

class StatusDasboard extends StatelessWidget {
  final String tittle;
  final String image;
  final Widget content;

  const StatusDasboard({
    super.key,
    required this.tittle,
    required this.image,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              image,
              height: 20,
              color: AppPallete.main,
            ),
            Gap(10),
            TxtCustom(
                tittle: tittle,
                fontSize: 14,
                color: AppPallete.black,
                fontWeight: FontWeight.bold),
          ],
        ),
        Spacer(),
        content
      ],
    );
  }
}

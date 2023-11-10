// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/report/currentReport.dart';
import 'package:final_project/appfiles/Home/report/previousReport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../customWidget/customAppBar.dart';

class HorseReport extends StatefulWidget {
  const HorseReport({
    Key? key,
  }) : super(key: key);

  @override
  State<HorseReport> createState() => _HorseReportState();
}

class _HorseReportState extends State<HorseReport>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBarD(
          title: 'Horse Report',
        ),
        body: ListView(
          children: [
            _headScetion(),
            Gap(10),
            Container(
              height: 20.h,
              child: Row(
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    // indicator: CircleTab(color: iconColor, radius: 4),
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    labelPadding: EdgeInsets.only(left: 40, right: 65),
                    isScrollable: true,
                    labelColor: iconColor,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(text: 'Previous Race'),
                      Tab(text: 'Cureent Race'),
                    ],
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              width: double.maxFinite,
              height: height.h,
              child: TabBarView(
                controller: _tabController,
                children: [
                  PreviousReport(),
                  CurrentReport(),
                ],
              ),
            ),
          ],
        ));
  }
}

_headScetion() {
  return SafeArea(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.maxFinite,
          height: 140.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://firebasestorage.googleapis.com/URL_LINK'),
                fit: BoxFit.fill),
            gradient: LinearGradient(
              colors: [
                iconColor.withOpacity(0.9),
                Colors.white.withOpacity(0.7),
              ],
              // begin: Alignment.bottomLeft, end: Alignment.center
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            boxShadow: const [
              BoxShadow(offset: Offset(2, 2), blurRadius: 7, color: iconColor),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.only(left: 280, top: 30, right: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: white,
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                        child: Text(
                          "Horse",
                          style: mystyle20B,
                        ),
                      ),
                      Gap(15),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: white,
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ]),
                        child: Text(
                          "Report",
                          style: mystyle20B,
                        ),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}



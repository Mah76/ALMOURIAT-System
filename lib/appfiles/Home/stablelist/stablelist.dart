// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/stablelist/Royalist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../customWidget/customAppBar.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  List pageBody = [
    'Stable List',
    'Horse           Stables',
    'Bahrain Stables list',
    'Royalist',
    'Parents',
  ];
  List pageImage = [
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: pageBody[0],
          isLeading: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: MediaQuery.of(context).size.width * .95,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(pageImage[0]),
                              fit: BoxFit.fill),
                          gradient: LinearGradient(
                            colors: [
                              iconColor.withOpacity(0.8),
                              white.withOpacity(0.9),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                          padding: const EdgeInsets.only(
                              left: 60, top: 60, right: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: iconColor,
                                        blurRadius: 30,
                                        offset: Offset(2, 2))
                                  ]),
                                  child: Text(pageBody[1],
                                      style: textSlestyle(context, white, 30.sp,
                                          FontWeight.bold)),
                                ),
                                Gap(30),
                              ]))),
                  Container(
                      height: 35.h,
                      width: Get.width * .95,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 20.0,
                            spreadRadius: 4.0,
                          ),
                        ],
                      ),
                      child: TabBar(
                        indicatorColor: white,
                        controller: _tabController,
                        labelPadding: EdgeInsets.symmetric(horizontal: 50),
                        isScrollable: true,
                        labelColor: white,
                        unselectedLabelColor: Colors.grey,
                        tabs: [
                          Tab(text: pageBody[3]),
                          Tab(text: pageBody[4]),
                        ],
                      )),
                  SizedBox(
                    height: Get.height,
                    child: TabBarView(controller: _tabController, children: [
                      Royalist(collection: 'RoyalistStable'),
                      Royalist(collection: 'ParentsStable'),
                    ]),
                  ),
                ]))));
  }
}

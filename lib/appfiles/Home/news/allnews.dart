// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../customWidget/customAppBar.dart';

class AllNews extends StatefulWidget {
  const AllNews({
    Key? key,
  }) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

List pageBody = [
  'News',
  'Search',
  'Today News',
  '8  news',
  'This our newest video we will notify you when is a new video is upload',
  'You have watched all videos for today you can watch out previous videos by choosing the date',
  'Loading..',
];

class _AllNewsState extends State<AllNews> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: pageBody[0],
          isLeading: false,
        ),
        body: SafeArea(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Container(
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                margin: EdgeInsets.only(bottom: 15),
                width: width,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container()),
                        InkWell(
                          onTap: () async {
                            var pickedDate_ = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2055));
                          },
                          child: Icon(
                            Icons.calendar_month,
                            size: 14.sp,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                    Gap(15),
                    Container(
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: iconColor,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: white,
                            size: 15.sp,
                          ),
                          Padding(padding: EdgeInsets.only(left: 5.sp)),
                          Text(pageBody[1],
                              style: textSlestyle(
                                  context, white, 15.sp, FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            iconColor,
                            Colors.grey.withOpacity(0.9),
                          ]),
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(50))),
                      child: Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(children: [
                            Row(
                              children: [
                                Text(pageBody[2],
                                    style: textSlestyle(context, white, 15.sp,
                                        FontWeight.bold)),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.newspaper,
                                      size: 17,
                                      color: white,
                                    ),
                                    Gap(10),
                                    Text(pageBody[3],
                                        style: textSlestyle(context, white,
                                            14.sp, FontWeight.normal)),
                                  ],
                                ),
                              ],
                            ),
                            Gap(20),
                            Expanded(
                              flex: 1,
                              child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 20,
                                          childAspectRatio: 12 / 16,
                                          crossAxisCount: 3),
                                  itemCount: 8,
                                  itemBuilder: (context, index) {
                                    return FutureBuilder(
                                        future: FirebaseStorage.instance
                                            .ref(
                                                '/News/photos/n${index + 1}.png')
                                            .getDownloadURL(),
                                        builder: (context, snapshot) {
                                          if (!snapshot.hasData) {
                                            return const CircularProgressIndicator(
                                              color: iconColor,
                                            );
                                          }
                                          return InkWell(
                                            onTap: () {
                                              Get.toNamed(
                                                  AppRoute.getnewsPage());
                                            },
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        offset: Offset(3, 3),
                                                        color: iconColor,
                                                      ),
                                                      BoxShadow(
                                                        blurRadius: 3,
                                                        offset: Offset(-3, -3),
                                                        color: white
                                                            .withOpacity(0.9),
                                                      ),
                                                    ],
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image:
                                                            CachedNetworkImageProvider(
                                                                snapshot
                                                                    .data!))),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                          height: 30.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: white
                                                                .withOpacity(
                                                                    0.9),
                                                          ),
                                                          child: Center(
                                                              child: Text(
                                                            '${pageBody[0]} ${index + 1}',
                                                            style: textSlestyle(
                                                                context,
                                                                textColor,
                                                                15.sp,
                                                                FontWeight
                                                                    .normal),
                                                          )))
                                                    ])),
                                          );
                                        });
                                  }),
                            )
                          ]),
                        ),
                      )))
            ])));
  }
}

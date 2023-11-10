// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../customWidget/customAppBar.dart';

class NewsPage extends StatelessWidget {
  NewsPage({Key? key}) : super(key: key);

  List pageBody = [
    'News Details',
    "إنجاز تاريخي و عالمي من بطل العالم بوحمد 🌍🥇🐎",
    '25/02/2023',
    'مقدمة',
    " فاز الشيخ ناصر بن حمد مستشارالأمن الوطني قائد الحرس الملكي، في مملكة البحرين، ببطولة العالم لسباقات القدرة التي أقيمت في الإمارات بمشاركة 126 فارسا وفارسة يمثلون 36 دولة حول العالم.",
  ];
  List pageImage = [
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: pageBody[0],
        isLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ImageSlideshow(
              width: double.infinity,
              height: 300.h,
              initialPage: 0,
              indicatorColor: white,
              indicatorBackgroundColor: iconColor,
              children: [
                Image(
                  image: CachedNetworkImageProvider(pageImage[0]),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: CachedNetworkImageProvider(pageImage[1]),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: CachedNetworkImageProvider(pageImage[2]),
                  fit: BoxFit.cover,
                ),
                Image(
                  image: CachedNetworkImageProvider(pageImage[3]),
                  fit: BoxFit.cover,
                ),
              ],
              autoPlayInterval: 3000,
              isLoop: true,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        pageBody[1],
                        style: mystyle15B,
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Icon(Icons.date_range_outlined, color: iconColor),
                          SizedBox(width: 10),
                          Text(
                            pageBody[2],
                            style: textSlestyle(
                                context, textColor, 12.sp, FontWeight.normal),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(pageBody[3],
                      style: textSlestyle(
                          context, textColor, 15.sp, FontWeight.bold)),
                  SizedBox(height: 30),
                  Text(pageBody[4],
                      style: textSlestyle(
                          context, textColor, 15.sp, FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/route.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../customWidget/customAppBar.dart';
import '../../../customWidget/customButton.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

List pageBody = [
  'Bahrain Endurance Race',
  'Endurance Races Videos',
  'Endurance Race News,',
  'Follow up all our news',
  'News',
  'View all',
];
List pageImage = [
  'https://firebasestorage.googleapis.com/URL_LINK',
  'https://firebasestorage.googleapis.com/URL_LINK',
  'https://firebasestorage.googleapis.com/URL_LINK',
  'https://firebasestorage.googleapis.com/URL_LINK',
];

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: pageBody[0],
        isLeading: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 140.h,
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
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.only(left: 80, top: 60, right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: iconColor,
                              blurRadius: 30,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Text(pageBody[1],
                            style: textSlestyle(
                                context, white, 20.sp, FontWeight.bold)),
                      ),
                      Gap(30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoute.getvideoPage());
                            },
                            child: Icon(
                              Icons.play_circle_fill,
                              color: white,
                              size: 40,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(20),
              SizedBox(
                height: 120.h,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(pageImage[1]),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(6, 5),
                            blurRadius: 10,
                            color: iconColor,
                          ),
                          BoxShadow(
                            offset: Offset(-1, -1),
                            blurRadius: 10,
                            color: iconColor,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(right: 250, top: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider((pageImage[2])),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 170, top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        children: [
                          Text(pageBody[2],
                              style: textSlestyle(
                                  context, textColor, 17.sp, FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(pageBody[3],
                              style: textSlestyle(
                                  context, textColor, 12.sp, FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Text(pageBody[4],
                        style: textSlestyle(
                            context, textColor, 14.sp, FontWeight.bold)),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.getallNewsPage());
                      },
                      child: Text(pageBody[5],
                          style: textSlestyle(
                              context, textColor, 13.sp, FontWeight.bold)),
                    ),
                    Gap(5),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: iconColor,
                      size: 15,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream:
                      FirebaseFirestore.instance.collection('news').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return const LoadingIndicator();
                    if (snapshot.hasError) {
                      return ElevatedButton(
                          onPressed: () {}, child: Text('Error Refresh'));
                    }
                    final docs = snapshot.data!.docs;
                    return ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: docs
                            .map((e) => NewsShape(
                                  item: e.data(),
                                ))
                            .toList());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NewsShape extends StatelessWidget {
  final Map<String, dynamic> item;
  const NewsShape({Key? key, required this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      child: Column(
        children: [
          FutureBuilder<String>(
              future: FirebaseStorage.instance
                  .ref('/News/photos/${item['image']}')
                  .getDownloadURL(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(
                    color: iconColor,
                  );
                }
                if (snapshot.hasError) return const Text('Error');
                return Container(
                  height: 75.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: iconColor,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(snapshot.data!),
                    ),
                  ),
                );
              }),
          Gap(8),
          Text('${item['title']}',
              style: mystyle10, textAlign: TextAlign.center),
          const Gap(5),
          Text('${item['Body']}', style: mystyle10, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}

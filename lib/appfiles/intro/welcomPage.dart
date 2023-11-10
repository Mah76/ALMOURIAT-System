// ignore_for_file: prefer_const_constructors, unnecessary_new
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../customWidget/customButton.dart';

// ignore: must_be_immutable
class WelcomePage extends StatelessWidget {
  WelcomePage({super.key});

  List pageBody = [
    'Login',
    'Continue as a Guest',
    'Hello,',
    'Welcome To',
    'Almouriat',
  ];
  List pageImage = [
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(pageImage[0]),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: <Widget>[
              _logoWidget(),
              Gap(70),
              _textWidget(),
              Gap(80),
              CustomButton(
                buttonText: pageBody[0],
                buttonPressed: () {
                  Get.toNamed(AppRoute.getloginPage());
                },
              ),
              Gap(15),
              CustomButton(
                buttonText: pageBody[1],
                buttonPressed: () {
                  Get.toNamed(AppRoute.gethomePage());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _logoWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: CachedNetworkImageProvider(pageImage[1]),
        ),
      ],
    );
  }

  Widget _textWidget() {
    return Column(
      children: [
        Text(
          pageBody[2],
          textAlign: TextAlign.center,
          style: mystyle30,
        ),
        Gap(10.sp),
        new Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                pageBody[3],
                style: mystyle30,
              ),
              Gap(10.sp),
              Text(pageBody[4], style: mystyle30),
            ],
          ),
        ),
      ],
    );
  }
}

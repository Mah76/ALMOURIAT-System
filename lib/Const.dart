// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const String google_api_key = "";

const textColor = Color.fromARGB(218, 146, 45, 46);
const textColor2 = Color.fromARGB(218, 72, 70, 67);
const textColor3 = Color.fromARGB(218, 195, 173, 87);

const iconColor = Color.fromARGB(218, 146, 45, 46);

const backgroundColor = Color.fromARGB(255, 236, 237, 234);

const homepagecolor = [Color.fromRGBO(0, 149, 246, 1)];
const secondaryColor = Colors.grey;
const Color black = Color(0xFF191555);
const Color white = Color(0xFFFFFFFF);
const Color bgColor = Color(0xFF4448FF);
const Color selectColor = Color(0xFF4B3FFF);

textSlestyle(BuildContext context, Color color, fontSize, fontWeight) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: ('Montserrat Classic'),
    fontWeight: fontWeight,
    color: color,
  );
}




class Layout {
  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight() {
    return Get.height;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }
}

class AppDimensions {
  static double fontsizeExtraSmall = Get.context!.width >= 1170 ? 16 : 12;

  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;
  static double pageViewContainer = screenHeight / 3.84;
  static double pageViewTextContainer = screenHeight / 7.03;


}






import 'package:final_project/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

CustomSanckbar(String message, {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    backgroundColor: iconColor,
    colorText: white,
    messageText: Text(message,
        style: TextStyle(
            fontSize: 12.sp,
            fontFamily: ('Montserrat Classic'),
            color: white,
            fontWeight: FontWeight.bold)),
    margin: EdgeInsets.all(10.sp),
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 6),
    isDismissible: true,
    borderRadius: 10.sp,
    icon: const Icon(
      Icons.notifications,
      color: white,
    ),
  );
}

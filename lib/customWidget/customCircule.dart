import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Const.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator(
          color: iconColor,
        ),
      ),
    );
  }
}
    // print("testing" + Get.find<RegistrationController>().isloding.toString());

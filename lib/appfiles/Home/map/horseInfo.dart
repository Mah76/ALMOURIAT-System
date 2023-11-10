import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../Const.dart';

class Horseinfo extends StatelessWidget {
  const Horseinfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: white,
        padding: const EdgeInsets.only(top: 16),
        child: ListTile(
          iconColor: iconColor,
          leading: const CircleAvatar(
            backgroundColor: iconColor,
            radius: 24,
            backgroundImage: AssetImage("img/icons/horseiconmap.png"),
          ),
          title: const Text(
            "PRINCESSE SAFINAT",
            style: TextStyle(fontWeight: FontWeight.w500, color: iconColor),
          ),
          subtitle: const Text("860m - 28min"),
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: iconColor,
              shape: const CircleBorder(),
            ),
            onPressed: () {},
            child: Lottie.network(
                'https://firebasestorage.googleapis.com/v0/b/hcrsbh-b87b6.appspot.com/o/Json%2Fhorseactivity.json?alt=media&token=b1553bb0-4e11-4908-9eac-baccad99d9e1',
                height: 90.h,
                width: 40),
          ),
        ),
      ),
    );
  }
}

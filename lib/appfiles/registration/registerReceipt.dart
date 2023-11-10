// ignore_for_file: prefer_const_constructors

import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/data/controllers/HorseController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Receipt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    // take the the varaible from the FormRegistration page
    final String raceid = Get.arguments[0];
    final String horseid = Get.arguments[1];
    final String riderpassport = Get.arguments[2];
    final String trainerpassport = Get.arguments[3];
    final String stages = Get.arguments[4];
    final String stablename = Get.arguments[5];

    return  Scaffold(
        body: SafeArea(
      child: Container(
          //padding: EdgeInsets.only(top: 180, right: 280),
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: AssetImage('img/re_background.png'),
            ),
          ),

          child: Container(
            padding: EdgeInsets.only(top: 250),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 60.h,
                          width: 70.w,
                          child: Lottie.asset(
                            'img/jsonImage/rec2.json',
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: Text(
                                'Received',
                                style: mystyle20B,
                              ),
                            ),
                            Text(
                              'Your Registration is successfully received',
                              style: mystyle12,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 150.h,
                  width: 350.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.grey)),
                  child: Container(
                    padding: EdgeInsets.only(top: 5),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Race',
                              style: mystyle12,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Horse',
                              style: mystyle12,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Rider',
                              style: mystyle12,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Trainer',
                              style: mystyle12,
                            ),
                            SizedBox(width: 20),
                            Text(
                              'Stable Name',
                              style: mystyle12,
                            ),
                            SizedBox(width: 20),
                            Text(
                              "Stages",
                              style: mystyle12,
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: iconColor,
                        ),
                        GetBuilder<HorseController>(
                          builder: (horsedata) {
                            return Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          raceid,
                                          style: mystyle12,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          ' ${horsedata.horsemodel[int.parse(horseid) - 1].name} ',
                                          style: mystyle12,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          riderpassport,
                                          style: mystyle12,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          trainerpassport,
                                          style: mystyle12,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          stablename,
                                          style: mystyle12,
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          stages,
                                          style: mystyle12,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: 200.w,
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        foregroundColor: textColor,
                        backgroundColor: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'Done',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:final_project/Const.dart';
import 'package:final_project/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return _ShapeView();
              })
        ],
      ),
    );
  }
}

class _ShapeView extends StatelessWidget {
  const _ShapeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = Layout.getSize(context);
    return SizedBox(
        width: size.width * 0.85.w,
        height: 130.h,
        child: Container(
          margin: EdgeInsets.only(
            right: Layout.getHeight(15),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoute.getresultPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              '09-10 DEC-2022',
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ('Montserrat Classic'),
                                  color: iconColor),
                            ),
                          ),
                          Text(
                            "National Day ",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: ('Montserrat Classic'),
                                color: iconColor),
                          ),
                          SizedBox(
                            child: Material(
                              child: Container(
                                width: 55.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: iconColor),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.only(left: 6.sp)),
                                    InkWell(
                                      child: Text(
                                        'More',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ('Montserrat Classic'),
                                          color: white,
                                        ),
                                      ),
                                    ),
                                    ImageIcon(
                                      AssetImage(
                                        "img/icons/button.png",
                                      ),
                                      color: white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            " 8 Stables ",
                            style: mystyle15,
                          ),
                          Expanded(child: Container()),
                          CircleContainer(),
                          Expanded(
                            child: Stack(
                              children: [
                                SizedBox(
                                  height: 24.h,
                                  child: LayoutBuilder(
                                    builder: (BuildContext context,
                                        BoxConstraints constraints) {
                                      return Flex(
                                        direction: Axis.horizontal,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            (constraints.constrainWidth() / 8)
                                                .floor(),
                                            (index) => SizedBox(
                                                  width: 3.w,
                                                  height: 1.h,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                        color: iconColor),
                                                  ),
                                                )),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            // child: Transform.rotate(
                            //   angle: 0,
                            child: ImageIcon(
                              size: 50.sp,
                              AssetImage(
                                "img/icons/horseicon.png",
                              ),
                              color: iconColor,
                            ),
                          ),
                          CircleContainer(),
                          Expanded(flex: 1, child: Container()),
                          Text(
                            "20 Horse",
                            style: mystyle15,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              '40Km',
                              style: mystyle15,
                            ),
                          ),
                          Text(
                            "60Km",
                            style: mystyle15,
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Text(
                              '120Km',
                              style: mystyle15,
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CircleContainer extends StatelessWidget {
  const CircleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 2.5.w, color: iconColor),
      ),
    );
  }
}

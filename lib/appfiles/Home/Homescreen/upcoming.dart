// ignore_for_file: prefer_const_constructors

import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/data/controllers/Racescontroller.dart';
import 'package:final_project/appfiles/data/controllers/stagecontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class UpComing extends StatelessWidget {
  const UpComing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = Layout.getSize(context);
    return Column(
      children: [
        GetBuilder<RacesController>(
          builder: (racedata) {
            return racedata.isDataLoading
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: racedata.racemodel.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          GetBuilder<RacesController>(builder: (racedata) {
                            return GestureDetector(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 70.w,
                                          child: Text(
                                              racedata.racemodel[index].date!,
                                              style: textSlestyle(
                                                  context,
                                                  iconColor,
                                                  11.sp,
                                                  FontWeight.bold)),
                                        ),
                                        Text(racedata.racemodel[index].name!,
                                            style: textSlestyle(
                                                context,
                                                iconColor,
                                                11.sp,
                                                FontWeight.bold)),
                                        Container(
                                          width: 55.w,
                                          height: 15.h,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: iconColor),
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Row(
                                            children: [
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 6.sp)),
                                              InkWell(
                                                child: Text('More',
                                                    style: textSlestyle(
                                                        context,
                                                        white,
                                                        11.sp,
                                                        FontWeight.bold)),
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
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          flex: 1,
                                          child: Row(
                                            children: <Widget>[
                                              Text(" 8 Stables ",
                                                  style: textSlestyle(
                                                      context,
                                                      textColor,
                                                      15.sp,
                                                      FontWeight.normal)),
                                              Expanded(child: Container()),
                                              CircleContainer(),
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    SizedBox(
                                                      height: 24.h,
                                                      child: LayoutBuilder(
                                                        builder: (BuildContext
                                                                context,
                                                            BoxConstraints
                                                                constraints) {
                                                          return Flex(
                                                            direction:
                                                                Axis.horizontal,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children:
                                                                List.generate(
                                                                    //6
                                                                    (constraints.constrainWidth() /
                                                                            8)
                                                                        .floor(),
                                                                    (index) =>
                                                                        SizedBox(
                                                                          width:
                                                                              3.w,
                                                                          height:
                                                                              1.h,
                                                                          child:
                                                                              DecoratedBox(
                                                                            decoration:
                                                                                BoxDecoration(color: iconColor),
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
                                                child: ImageIcon(
                                                  size: 50.sp,
                                                  AssetImage(
                                                    "img/icons/horseicon.png",
                                                  ),
                                                  color: iconColor,
                                                ),
                                              ),
                                              CircleContainer(),
                                              Expanded(
                                                  flex: 1, child: Container()),
                                              Text("20 Horse",
                                                  style: textSlestyle(
                                                      context,
                                                      textColor,
                                                      15.sp,
                                                      FontWeight.normal)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    GetBuilder<StageController>(
                                      builder: (stagedata) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              stagedata
                                                  .stagemodel[index].distance
                                                  .toString(),
                                              style: mystyle15,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                    Container(
                                      color: iconColor,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            height: 10.h,
                                            width: 7.w,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: backgroundColor,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: LayoutBuilder(
                                              builder: (BuildContext context,
                                                  BoxConstraints constraints) {
                                                // print("The width is ${constraints.constrainWidth()}");
                                                return Flex(
                                                  direction: Axis.horizontal,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      (constraints.constrainWidth() /
                                                              10)
                                                          .floor(),
                                                      (index) => SizedBox(
                                                            width: 2.w,
                                                            height: 3.h,
                                                            child: DecoratedBox(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color:
                                                                          white),
                                                            ),
                                                          )),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            height: 11.h,
                                            width: 8.w,
                                            child: DecoratedBox(
                                              decoration: BoxDecoration(
                                                color: backgroundColor,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      );
                    })
                : Center(
                    child: CircularProgressIndicator(
                    color: iconColor,
                  ));
          },
        ),
      ],
    );
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

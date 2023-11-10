import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Const.dart';
import '../../customWidget/customAppBar.dart';
import '../../route.dart';
import '../data/API/const.dart';
import '../data/controllers/Racescontroller.dart';

class RigsterHome extends StatefulWidget {
  RigsterHome({
    Key? key,
  }) : super(key: key);

  @override
  State<RigsterHome> createState() => _RigsterHomeState();
}

class _RigsterHomeState extends State<RigsterHome> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBarD(
        title: 'Registration',
      ),
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              _headScetion(),
              Positioned(
                top: 250.h,
                left: 0,
                right: 0,
                bottom: 0,
                child: GetBuilder<RacesController>(
                  builder: (racedata) {
                    return racedata.isDataLoading
                        ? ListView.builder(
                            itemCount: racedata.racemodel.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  //    var raceid = racedata.racemodel[index].id;
                                  //  print(raceid);
                                  Get.toNamed(
                                    AppRoute.getformregistrationPage(),
                                    arguments: racedata.racemodel[index].id,
                                  );
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, right: 10),
                                  height: 75.h,
                                  width: 355.w,
                                  decoration: const BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                    ),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset: Offset(1, 1),
                                        blurRadius: 1,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50.h,
                                                  width: 50.w,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: NetworkImage(
                                                            "${AppConsts.BASE_URL}project_db/public/uploads/${racedata.racemodel[index].img!}"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        width: 2.w,
                                                        color: iconColor
                                                            .withOpacity(0.6),
                                                      )),
                                                ),
                                                const Gap(40),
                                                Column(
                                                  children: [
                                                    Text(
                                                      racedata.racemodel[index]
                                                          .name!,
                                                      style: textSlestyle(
                                                          context,
                                                          iconColor,
                                                          15.sp,
                                                          FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                        racedata
                                                            .racemodel[index]
                                                            .date!,
                                                        style: textSlestyle(
                                                            context,
                                                            iconColor,
                                                            10.sp,
                                                            FontWeight.normal)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                        : const Center(
                            child: CircularProgressIndicator(
                            color: iconColor,
                          ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _headScetion() {
    return Column(
      children: [
        SizedBox(
          height: 230.h,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('img/reigster.png')),
                  ),
                ),
              ),
              Positioned(
                top: 190,
                child: Container(
                  child: Lottie.asset(
                    'img/jsonImage/register2.json',
                    height: 100.h,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

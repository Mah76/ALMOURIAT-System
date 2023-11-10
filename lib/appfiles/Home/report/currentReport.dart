import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/map/map.dart';
import 'package:final_project/appfiles/data/controllers/HorseController.dart';
import 'package:final_project/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CurrentReport extends StatefulWidget {
  const CurrentReport({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentReport> createState() => _CurrentReportState();
}

class _CurrentReportState extends State<CurrentReport> {
  @override
  Widget build(BuildContext context) {
    // print(_controller.list);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          GetBuilder<HorseController>(
            builder: (horsedata) {
              return horsedata.isDataLoading
                  ? ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: horsedata.horsemodel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Maptracking()));
                            // Get.to(() => Maptracking());
                            // Get.toNamed(AppRoute.getmaptrackingPage());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20, right: 10),
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
                                  blurRadius: 10.0,
                                  spreadRadius: 3,
                                ),
                              ],
                            ),
                            child: Container(
                              margin: const EdgeInsets.only(top: 10, left: 15),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Horse:  " +
                                                    " " +
                                                    horsedata.horsemodel[index]
                                                        .name!,
                                                style: mystyle15B,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "DOB:  " +
                                                    " " +
                                                    horsedata
                                                        .horsemodel[index].dOB!,
                                                style: mystyle10,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                "vaccineExpire:  " +
                                                    " " +
                                                    horsedata.horsemodel[index]
                                                        .vaccineExpire!,
                                                style: mystyle10,
                                              ),
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
                  : Center(
                      child: CircularProgressIndicator(
                      color: iconColor,
                    ));
            },
          ),
        ],
      ),
    );
  }

  _headScetion() {
    return SafeArea(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width * .95,
            height: 140.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      'https://firebasestorage.googleapis.com/URL_LINK'),
                  fit: BoxFit.fill),
              gradient: LinearGradient(
                colors: [
                  iconColor.withOpacity(0.9),
                  Colors.white.withOpacity(0.7),
                ],
                // begin: Alignment.bottomLeft, end: Alignment.center
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(2, 2), blurRadius: 7, color: iconColor),
              ],
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 280, top: 30, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: white,
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                          child: Text(
                            "Horse",
                            style: mystyle20B,
                          ),
                        ),
                        Gap(15),
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: white,
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                          child: Text(
                            "Report",
                            style: mystyle20B,
                          ),
                        ),
                      ])),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

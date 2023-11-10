// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Royalist extends StatelessWidget {
  final String collection;
  const Royalist({Key? key, required this.collection}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collection).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data!.docs.reversed.toList();
        return ListView.builder(
            itemCount: data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) => CardView(
                  data: data[index].data(),
                ));
      },
    ).paddingOnly(bottom: 200);
  }
}

class CardView extends StatelessWidget {
  const CardView({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.all(10),
          height: 120.h,
          decoration: BoxDecoration(
              color: white, borderRadius: BorderRadius.circular(10)),
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Padding(padding: EdgeInsets.only(top: 10, right: 5)),
            Builder(
              builder: (context) {
                if (data['img'] == null) return Image.asset('img/L-one.png');
                if (data['img'] is String) {
                  return CachedNetworkImage(imageUrl: data['img']);
                }
                return Icon(Icons.no_photography);
              },
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data['name'] ?? '',
                        style: textSlestyle(
                            context, textColor, 20.sp, FontWeight.bold)),
                    Row(children: [
                      Lottie.network(
                          'https://firebasestorage.googleapis.com/URL_LINK',
                          height: 30.h),
                      Text("${data['instagram'] ?? ''}",
                          style: textSlestyle(
                              context, textColor, 12.sp, FontWeight.normal)),
                    ])
                  ]),
            )
          ])),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Divider(color: iconColor, thickness: 10, height: 10),
      ),
      Gap(10)
    ]);
  }
}

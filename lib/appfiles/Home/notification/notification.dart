import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../Const.dart';
import '../../../customWidget/customAppBar.dart';
import '../../../customWidget/customButton.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Notification',
        isLeading: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _headScetion(),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('notification')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const LoadingIndicator();
                  }
                  if (snapshot.hasError) {
                    return TextButton(
                        onPressed: () {
                          reassemble();
                        },
                        child: const Text('Error retry'));
                  }
                  final data = snapshot.data!.docs;
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return NotificationItem(data[index].data());
                      });
                },
              )
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
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                          'https://firebasestorage.googleapis.com/URL_LINK'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 170.h,
                child: Container(
                  child: Lottie.network(
                    'https://firebasestorage.googleapis.com/URL_LINK',
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

class NotificationItem extends StatelessWidget {
  final Map<String, dynamic> data;
  const NotificationItem(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: 355.w,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 50.h,
            width: 50.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(data['img'])),
                borderRadius: BorderRadius.circular(5),
                border:
                    Border.all(width: 2.w, color: iconColor.withOpacity(0.6))),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data['title'] ?? 'Loading...', style: mystyle15B),
                const SizedBox(height: 5),
                Text(data['title1'] ?? 'Loading...', style: mystyle10)
              ],
            ),
          ),
        ]));
  }
}


// ignore_for_file: prefer_const_constructors
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/Homescreen/result.dart';
import 'package:final_project/appfiles/Home/Homescreen/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../customWidget/customAppBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: CustomAppBarD(
          title: 'Home',
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                _headScetion(),
                Gap(10),
                Container(
                  height: 35.h,
                  width: width,
                  decoration: BoxDecoration(
                    color: iconColor,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 20.0,
                        spreadRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TabBar(
                          // indicator: CircleTab(color: iconColor, radius: 4),
                          indicatorColor: white,
                          controller: _tabController,
                          labelPadding: EdgeInsets.only(left: 20, right: 60),
                          isScrollable: true,
                          labelColor: white,
                          unselectedLabelColor: Colors.grey,
                          tabs: const [
                            Tab(text: 'Upcoming Races'),
                            Tab(text: 'Previous Results'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(10),
                SizedBox(
                  width: double.maxFinite,
                  height: height.h,
                  child: TabBarView(
                    controller: _tabController,
                    children: const [
                      UpComing(),
                      Result(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

_headScetion() {
  return Container(
    height: 145.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(50),
      ),
    ),
    child: Container(
      height: 120.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: iconColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Image(
        height: 110.h,
        width: 300.w,
        image: CachedNetworkImageProvider(
            'https://firebasestorage.googleapis.com/URL_LINK'),
      ),
    ),
  );
}






// class CircleTab extends Decoration {
//   final Color color;
//   double radius;
//   CircleTab({required this.color, required this.radius});
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) {
//     return _CirclePainter(color: color, radius: radius);
//   }
// }

// class _CirclePainter extends BoxPainter {
//   late Color color;
//   final double radius;
//   _CirclePainter({required this.color, required this.radius});
//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
//     late Paint _paint;
//     _paint = Paint()..color = color;
//     _paint = _paint..isAntiAlias = true;
//     final Offset circleOffest =
//         offset + Offset(cfg.size!.width / 2, cfg.size!.height - radius);
//     canvas.drawCircle(circleOffest, radius, _paint);
//   }
// }


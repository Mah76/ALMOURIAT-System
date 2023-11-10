// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/Home/Drawer/drawerwidget.dart';
import 'package:final_project/appfiles/Home/Homescreen/homescreenn.dart';
import 'package:final_project/appfiles/Home/news/newshome.dart';
import 'package:final_project/appfiles/Home/notification/notification.dart';
import 'package:final_project/appfiles/Home/profile/profile.dart';
import 'package:final_project/appfiles/Home/report/horsereport.dart';
import 'package:final_project/appfiles/Home/stablelist/stablelist.dart';
import 'package:final_project/appfiles/registration/registerHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePagetest extends StatefulWidget {
  const HomePagetest({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePagetest> createState() => _HomePagetestState();
}

class _HomePagetestState extends State<HomePagetest> {
  int currentIndex = 0;
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ZoomDrawer(
          menuScreen: DrawerScreen(
            currentIndex: 0,
            setIndex: (index) {
              setState(() {
                currentIndex = index;
                _drawerController.toggle!();
              });
            },
          ),
          controller: _drawerController,
          androidCloseOnBackTap: true,
          mainScreenTapClose: true,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.bounceIn,
          style: DrawerStyle.defaultStyle,
          mainScreen: currentScreen(context),
          borderRadius: 30,
          slideWidth: MediaQuery.of(context).size.width * 0.75,
          showShadow: false,
          angle: 0.0,
          menuBackgroundColor: backgroundColor,
          //           isRtl: Localizations.localeOf(context).languageCode == 'en'
//               ? false
//               : true,
//         ),
        ),
      ),
    );
  }

  Widget currentScreen(BuildContext context) {
    switch (currentIndex) {
      case 0:
        return BarScreen();

      case 1:
        return ProfileScreen();
      case 2:
        return NotificationScreen();
      case 3:
        return RigsterHome();
      case 4:
        return HomeScreen();
      //  FormRegistration(
      //   raceid: Get.arguments,
      // );
      case 5:
        return HorseReport();
      case 6:
        return HomeScreen();
      default:
        return HomeScreen();
    }
  }
}

class BarScreen extends StatefulWidget {
  const BarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BarScreen> createState() => _BarScreenState();
}

class _BarScreenState extends State<BarScreen> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    NotificationScreen(),
    NewsScreen(),
    ListScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            50.0,
          ),
          boxShadow: [
            BoxShadow(
              color: iconColor.withOpacity(0.08),
              spreadRadius: 1.0,
              blurRadius: 8.0,
              offset: const Offset(
                1,
                1,
              ),
            ),
          ],
          color: white,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35.0),
          child: GNav(
            gap: 10.0,
            backgroundColor: white,
            tabBorderRadius: 40.0,
            tabBackgroundColor: white,
            activeColor: iconColor,
            color: iconColor.withOpacity(0.55),
            selectedIndex: _selectedIndex,
            onTabChange: _onItemTapped,
            duration: Duration(milliseconds: 500), // tab animation duration
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
                padding: EdgeInsets.symmetric(
                 vertical: 15,
                  horizontal:20
                ),
              ),
              GButton(
                icon: Icons.notifications,
                text: "Notification",
                padding: EdgeInsets.symmetric(
                 vertical: 15,
                  horizontal:20
                ),
              ),
              GButton(
                icon: Icons.newspaper,
                text: "News",
                padding: EdgeInsets.symmetric(
                 vertical: 15,
                  horizontal:20
                ),
              ),
              GButton(
                icon: Icons.list,
                text: "Stable list",
                padding: EdgeInsets.symmetric(
                 vertical: 15,
                  horizontal:20
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}






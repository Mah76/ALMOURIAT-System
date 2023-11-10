import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../Const.dart';
import '../../data/controllers/user_controller.dart';
import '../../intro/splashPage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: const Icon(
        Icons.menu,
        color: iconColor,
      ),
    );
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  final int currentIndex;

  const DrawerScreen(
      {Key? key, required this.setIndex, required this.currentIndex})
      : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final userController = Get.put(UserController(), tag: 'user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: iconColor,
      body: ListView(
        primary: true,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 50),
        children: [
          Obx(
            () => SizedBox(
              height: 65,
              child: userController.isLoading.isTrue
                  ? const CircularProgressIndicator(
                          color: white, strokeWidth: 7)
                      .marginSymmetric(horizontal: 60)
                  : ListTile(
                      leading: const CircleAvatar(
                          backgroundColor: white,
                          maxRadius: 13,
                          child: Icon(Icons.person, color: iconColor)),
                      minLeadingWidth: 0,
                      isThreeLine:
                          userController.currentUserModel.value != null,
                      horizontalTitleGap: 8,
                      subtitle: userController.currentUserModel.value == null
                          ? null
                          : Text(
                              userController.currentUserModel.value?.phone ??
                                  '',
                              style: const TextStyle(
                                  color: white, fontWeight: FontWeight.bold)),
                      title: Text(
                          userController.currentUserModel.value?.name ??
                              'Guest',
                          style: const TextStyle(
                              color: white, fontWeight: FontWeight.bold))),
            ),
          ),
          drawerList(const FaIcon(FontAwesomeIcons.house), "Home", 0),
          containerLine(),
          list('information'),
          drawerList(
              const FaIcon(FontAwesomeIcons.penToSquare), "Edit profile", 1),
          drawerList(const FaIcon(FontAwesomeIcons.bell), "Notification", 2),
          containerLine(),
          list('Race'),
          drawerList(
              const FaIcon(FontAwesomeIcons.registered), "Registration", 3),
          drawerList(
              const FaIcon(FontAwesomeIcons.clockRotateLeft), "History", 4),
          drawerList(const FaIcon(FontAwesomeIcons.list), "Report", 5),
          containerLine(),
          list('information'),
          drawerList(const FaIcon(FontAwesomeIcons.headphonesSimple),
              "  Contact us", 6),
          drawerList(
              const FaIcon(FontAwesomeIcons.rightFromBracket),
              userController.currentUserModel.value != null
                  ? 'logout'
                  : 'login',
              7, onTap: () async {
            final router = Navigator.of(context);
            await FirebaseAuth.instance.signOut();
            Get.delete(tag: 'user');
            router.pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (context) => const SplashPage(
                          showOnBoard: false,
                        )),
                (route) => false);
          }),
          Image.asset(
            'img/Almouriat.png',
            color: white,
          ),
        ],
      ),
    );
  }

  Widget list(String text) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 4),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(
                  color: white, fontWeight: FontWeight.bold, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerList(FaIcon icon, String text, int index,
      {VoidCallback? onTap}) {
    bool isSelected = widget.currentIndex == index;

    return GestureDetector(
      onTap: () {
        widget.setIndex(index);
        widget.currentIndex == index;
        if (onTap != null) {
          onTap();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(bottom: 3),
        height: MediaQuery.of(context).size.height * 0.06,
        color: isSelected ? white : null,
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            FaIcon(
              icon.icon,
              color: isSelected ? textColor : white,
            ),
            const Gap(10),
            Text(
              text,
              style: TextStyle(
                color: isSelected ? textColor : white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget containerLine() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: white,
          border: Border(
            bottom: BorderSide(
              color: white.withOpacity(0.5),
              width: 2.0,
            ),
          )),
    );
  }
}

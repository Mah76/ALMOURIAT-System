import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Const.dart';
import '../appfiles/Home/Drawer/drawerwidget.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  bool isLeading = false;

  CustomAppBar({
    super.key,
    required this.title,
    required this.isLeading,
  });
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: mystyle20B),
      backgroundColor: backgroundColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: isLeading
          ? null
          : IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: textColor,
              ),
              onPressed: () {
                Get.back();
              },
            ),
    );
  }
}

// ignore: must_be_immutable
class CustomAppBarD extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBarD({
    super.key,
    required this.title,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title, style: mystyle20B),
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: const DrawerWidget());
  }
}

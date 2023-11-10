import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Const.dart';
import '../../../customWidget/customAppBar.dart';
import '../../data/controllers/StableController.dart';
import '../../data/controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController(), tag: 'user');

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBarD(
        title: 'Profile',
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ListView(children: [
              SingleSection(
                title: 'User Details',
                children: [
                  ListTileWidget(
                    color: iconColor,
                    title:
                        userController.currentUserModel.value?.name ?? 'Guest',
                    icon: Icons.person,
                    trailing: null,
                  ),
                  GetBuilder<StableController>(
                    builder: (stabledata) {
                      return stabledata.isDataLoading
                          ? ListTileWidget(
                              color: iconColor,
                              title:
                                  userController.currentUserModel.value?.name !=
                                          null
                                      ? stabledata.stablemodel[0].email!
                                      : 'null',
                              icon: Icons.email,
                              trailing: null,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: iconColor,
                            ));
                    },
                  ),
                  GetBuilder<StableController>(
                    builder: (stabledata) {
                      return stabledata.isDataLoading
                          ? ListTileWidget(
                              color: iconColor,
                              title:
                                  userController.currentUserModel.value?.name !=
                                          null
                                      ? stabledata.stablemodel[0].accessToken!
                                      : 'null',
                              icon: Icons.security,
                              trailing: null,
                            )
                          : const Center(
                              child: CircularProgressIndicator(
                              color: iconColor,
                            ));
                    },
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title.toUpperCase(),
              style:
                  textSlestyle(context, textColor, 15.sp, FontWeight.normal)),
        ),
        Container(
          width: double.infinity,
          color: white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

class ListTileWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  // final Widget? additionalWidget;

  final Widget? trailing;
  const ListTileWidget({
    super.key,
    required this.title,
    required this.icon,
    this.trailing,
    // this.additionalWidget,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        ListTile(
          title: Text(
            title,
            style: textSlestyle(context, textColor, 15.sp, FontWeight.normal),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          leading: Container(
            padding: const EdgeInsets.all(8),
            width: size.width * 0.11,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: color,
            ),
            child: Icon(
              icon,
              color: white,
            ),
          ),
          trailing: trailing,
        ),

        // if (additionalWidget != null) additionalWidget!,
      ],
    );
  }
}



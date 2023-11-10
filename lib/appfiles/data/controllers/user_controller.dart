import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/appfiles/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxService {
  final currentUserModel = Rxn(UserModel());
  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    _initUser();
  }

  void _initUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      currentUserModel(null);
      return;
    }
    // if (user != null) {
    //   final userDoc = await FirebaseFirestore.instance
    //       .collection('users')
    //       .doc(user.uid)
    //       .get();
    //   if (userDoc.exists) {
    //     currentUserModel.value = UserModel.fromMap(userDoc.data()!);

    final phoneNumber = user.phoneNumber;
    try {
      isLoading(true);
      final data = await FirebaseFirestore.instance
          .collection('users')
          .where("Phone", isEqualTo: phoneNumber?.replaceFirst('+973', ''))
          .limit(1)
          .get();
      if (data.docs.isNotEmpty) {
        currentUserModel(UserModel.fromMap(data.docs.first.data()));
      }
    } on Exception {
      if (Get.context != null) {
        ScaffoldMessenger.maybeOf(Get.context!)?.showSnackBar(
            const SnackBar(content: Text('Error in Loading user info')));
      }
    } finally {
      isLoading(false);
    }
  }
}

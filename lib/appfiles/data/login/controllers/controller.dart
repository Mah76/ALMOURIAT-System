import 'dart:io';
import '../../../Home/Drawer/home.dart';
import '../../../../customSnackbar.dart';
import '../../OTP/controllers/controllersOTP.dart';
import '../../phone_au/auth.dart';
import '../../OTP/views/OTPscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final phoneNumber = TextEditingController();
  final isLoading = false.obs;

  void goToAuthenticationScreen() {
    Get.to(() => const HomePagetest());
    // Get.toNamed(Routes.authentication);
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      isLoading.value = true;
      await UserServices.phoneNumberExists(phoneNumber.text.trim(),
          onError: (_) {
        isLoading.value = false;
      }).then((exist) {
        isLoading.value = false;
        if (exist) {
          final otpController = Get.put<OtpController>(OtpController());
          otpController.phoneNumber = phoneNumber.text;
          otpController.sendSmsToPhoneNumber();
          Get.to(() => OtpScreenTest());
        } else {
          CustomSanckbar("your phone number not exist", title: "Login Failed");
        }
      });
    }
  }
}

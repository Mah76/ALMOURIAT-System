import 'dart:async';
import 'dart:developer';
import 'package:final_project/appfiles/Home/Drawer/home.dart';
import 'package:final_project/customSnackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../phone_au/auth.dart';

class OtpController extends GetxService {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final otp = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late final Registrant? registrant;
  String? phoneNumber;

  String? verificationId;
  final isLoading = true.obs;

  final _durationTimeOut = const Duration(seconds: 60);
  final isCanResendCode = false.obs;
  final durationCountdown = 0.obs;

  void sendSmsToPhoneNumber() async {
    isLoading(true);
    isCanResendCode(false);
    if (phoneNumber != null) {
      await _auth.verifyPhoneNumber(
        phoneNumber: '+973$phoneNumber',
        verificationCompleted: (phoneAuthCredential) async {
          log("verify phone number : verification completed");
        },
        verificationFailed: (e) {
          isLoading(false);
          isCanResendCode(true);
          CustomSanckbar("", title: "Verification Failed");
        },
        codeSent: (id, forceResendingToken) async {
          log('SEND');
          log('CODE SENT');
          verificationId = id;
          isLoading.value = false;
          _validateCountdownResendCode();
        },
        codeAutoRetrievalTimeout: (verificationId) {},
        timeout: _durationTimeOut,
      );
    }
  }

  void verifySmsCode() async {
    if (formKey.currentState!.validate() && verificationId != null) {
      isLoading.value = false;

      try {
        final result = await _auth.signInWithCredential(
            PhoneAuthProvider.credential(
                verificationId: verificationId!, smsCode: otp.text));
        if (result.user != null) {
          _goToHome();
        }
      } catch (e) {
        isLoading.value = false;
        CustomSanckbar("Please enter the correct code", title: "Invalid Code");
        log("invalid code");
      }
    }
  }

  void _goToHome() {
    isLoading.value = false;
    Get.offAll(() => const HomePagetest());
  }

  void _validateCountdownResendCode() {
    isCanResendCode.value = false;
    var maxDurationInSecond = _durationTimeOut.inSeconds;
    var currentDurationSecond = 0;
    durationCountdown.value = maxDurationInSecond;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      currentDurationSecond++;
      if (maxDurationInSecond - currentDurationSecond >= 0) {
        durationCountdown.value = maxDurationInSecond - currentDurationSecond;
      } else {
        isCanResendCode.value = true;
        timer.cancel();
      }
    });
  }
}

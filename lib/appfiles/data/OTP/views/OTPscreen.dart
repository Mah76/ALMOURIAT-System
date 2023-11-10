// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/data/OTP/controllers/controllersOTP.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';

import '../../../../customWidget/customAppBar.dart';
import '../../../../customWidget/customGesureDetector.dart';

// ignore: must_be_immutable
class OtpScreenTest extends GetView<OtpController> {
  OtpScreenTest({Key? key}) : super(key: key);

  List pageBody = [
    'Your code on the Way!',
    'Please enter the code sent to',
    'Did not receive the code?',
    'Resend',
    'Verify',
  ];

  @override
  Widget build(BuildContext context) {
    OtpController Y = Get.put(OtpController());
    return CustomGestureDetector(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        appBar: CustomAppBar(
          title: '',
          isLeading: false,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15.sp),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _textBody(),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Image(
                      width: 400.w,
                      image: CachedNetworkImageProvider(
                          'https://firebasestorage.googleapis.com/v0/b/hcrsbh-b87b6.appspot.com/o/Home%2FHorse.gif?alt=media&token=022e242a-0970-4911-8373-06cbdfdb8b0d'),
                    ),
                  ),
                  Gap(50.sp),
                  _PinAutoField(),
                  Gap(50.sp),
                  _VerificationButton(),
                  _resendButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textBody() {
    OtpController T = Get.put(OtpController());
    return Column(
      children: [
        Text(
          pageBody[0],
          style: mystyle20,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        RichText(
          text: TextSpan(style: mystyle20, children: [
            TextSpan(text: pageBody[1]),
            TextSpan(
              text: T.phoneNumber ?? T.registrant?.phoneNumber ?? "-",
              style: mystyle20,
            ),
          ]),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _resendButton() {
    OtpController otpController = Get.put(OtpController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pageBody[2],
          style: mystyle20,
        ),
        Obx(
          () => TextButton(
            onPressed: (otpController.isCanResendCode.value)
                ? () => otpController.sendSmsToPhoneNumber()
                : null,
            child: Text(
              (otpController.durationCountdown.value) > 0
                  ? "${pageBody[3]}  (${otpController.durationCountdown.value})"
                  : "${pageBody[3]}",
              style: mystyle15,
            ),
          ),
        )
      ],
    );
  }
}

class _PinAutoField extends GetView<OtpController> {
  const _PinAutoField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController otpController = Get.put(OtpController());

    return Form(
      key: otpController.formKey,
      child: SizedBox(
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: InputDecorationTheme(fillColor: textColor),
          ),
          child: PinFieldAutoFill(
            controller: otpController.otp,
            codeLength: 6,
            decoration: BoxLooseDecoration(
              bgColorBuilder: FixedColorBuilder(white),
              strokeColorBuilder: FixedColorBuilder(textColor),
              gapSpace: 10,
            ),
          ),
        ),
      ),
    );
  }
}

class _VerificationButton extends GetView<OtpController> {
  const _VerificationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpController Y = Get.put(OtpController());

    return SizedBox(
      width: 200.sp,
      child: Obx(
        () => ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              foregroundColor: textColor,
              backgroundColor: Colors.white),
          onPressed: Y.isLoading.value ? null : () => Y.verifySmsCode(),
          child: controller.isLoading.value
              ? SizedBox(
                  width: 28,
                  height: 30,
                  child: CircularProgressIndicator(
                    color: iconColor,
                  ),
                )
              : Text(
                  "Verify",
                  style: mystyle20,
                ),
        ),
      ),
    );
  }
}
//   Row buildTimer() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         TweenAnimationBuilder(
//           tween: Tween(begin: 60.0, end: 0.0),
//           duration: Duration(seconds: 60),
//           builder: (_, dynamic value, child) => Text(
//             "00:${value.toInt()}",
//             style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ],
//     );
//   }
// }

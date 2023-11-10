import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Const.dart';
import '../appfiles/data/login/controllers/controller.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback buttonPressed;
  const CustomButton(
      {super.key, required this.buttonText, required this.buttonPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 250.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                foregroundColor: textColor,
                backgroundColor: white),
            onPressed: buttonPressed,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                buttonText,
                style: TextStyle(fontSize: 18.sp),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}

class CustomButtonSecond extends StatelessWidget {
  final VoidCallback? buttonPressed;
  final Widget child;
  const CustomButtonSecond(
      {super.key, required this.buttonPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          width: 250.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                foregroundColor: textColor,
                backgroundColor: white),
            onPressed: buttonPressed,
            child: Padding(padding: const EdgeInsets.all(14.0), child: child),
          ),
        ),
      ],
    ));
  }
}

class ButtonVerification extends GetView<LoginController> {
  final String textValue;
  final VoidCallback? buttonPressed;

  const ButtonVerification(
      {Key? key, required this.textValue, required this.buttonPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    LoginController X = Get.put(LoginController());

    return SizedBox(
      width: 200.sp,
      child: Obx(
        () => CustomButtonSecond(
          buttonPressed: buttonPressed,
          child: X.isLoading.value
              ? const LoadingIndicator()
              : Text(
                  textValue,
                  style: mystyle20,
                ),
        ),
      ),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      height: 25.h,
      child: const CircularProgressIndicator(
        color: iconColor,
      ),
    );
  }
}

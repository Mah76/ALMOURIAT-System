// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, camel_case_types

import 'package:final_project/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Const.dart';

class OnboardeTest extends StatefulWidget {
  @override
  State<OnboardeTest> createState() => _OnboardeTestState();
}

class _OnboardeTestState extends State<OnboardeTest> {
  bool firstOpen = true;

  _onIntroEnd(context) async {
    (await SharedPreferences.getInstance()).setBool('OnBoard', true);
    Get.toNamed(AppRoute.getwelcomePage());
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!firstOpen) {
        _onIntroEnd(context);
      }
    });
  }

  List pageTitle = [
    'Almouriat App',
    'Almouriat Users',
    'ٌRegistration process',
    'Save Your time',
    'Stables info',
    'Endurance Race News'
  ];

  List pageBody = [
    'If you are a horse lover,this is your place\nyou can use our app to view all about races in Bahrain dates, details, and news\nplus notify with all the events. You can continue as a guest.',
    'Welcome to your App. Please enter your registered phone number, followed by the OTP, to access your account.',
    'You can now easily register for endurance races through the application, track the status of your horses, and manage all of your data.',
    'To register for the race, you simply need to scan the barcode we provided for your horse.',
    'Inside the application, you can complete all of your tasks, and they will be stored in your file.',
    'You can find all the news and videos about Bahrain Endurance Race.',
  ];

  List imageList = [
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
    'https://firebasestorage.googleapis.com/URL_LINK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IntroductionScreen(
      globalBackgroundColor: backgroundColor,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: pageTitle[0],
          body: pageBody[0],
          image: Center(
            child: Lottie.network(imageList[0], repeat: false, height: 200.h),
          ),
          decoration: PageDecoration(
              titleTextStyle: mystyle30, bodyTextStyle: mystyle20),
        ),
        PageViewModel(
          title: pageTitle[1],
          body: pageBody[1],
          image: Center(
              child:
                  Lottie.network(imageList[1], repeat: false, height: 200.h)),
          decoration: PageDecoration(
            titleTextStyle: mystyle30,
            bodyTextStyle: mystyle20,
          ),
        ),
        PageViewModel(
          title: pageTitle[2],
          body: pageBody[2],
          image: Center(
              child: Lottie.network(
            imageList[2],
            height: 200.h,
            repeat: false,
          )),
          decoration: PageDecoration(
              titleTextStyle: mystyle30, bodyTextStyle: mystyle20),
        ),
        PageViewModel(
          title: pageTitle[3],
          body: pageBody[3],
          image: Center(
              child:
                  Lottie.network(imageList[3], repeat: false, height: 200.h)),
          decoration: PageDecoration(
              titleTextStyle: mystyle30, bodyTextStyle: mystyle20),
        ),
        PageViewModel(
          title: pageTitle[4],
          body: pageBody[4],
          image: Center(
              child:
                  Lottie.network(imageList[4], repeat: false, height: 200.h)),
          decoration: PageDecoration(
              titleTextStyle: mystyle30, bodyTextStyle: mystyle20),
        ),
        PageViewModel(
          title: pageTitle[5],
          body: pageBody[5],
          image: Center(
              child:
                  Lottie.network(imageList[5], repeat: false, height: 200.h)),
          decoration: PageDecoration(
              titleTextStyle: mystyle30, bodyTextStyle: mystyle20),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      nextFlex: 0,
      skip: const Text(
        'Skip',
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontFamily: ('Montserrat Classic'),
        ),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: textColor,
      ),
      done: const Text('Done',
          style: TextStyle(
              fontSize: 18,
              fontFamily: ('Montserrat Classic'),
              color: textColor)),
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.all(4),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: textColor,
        activeSize: Size(22.0, 10.0),
        activeColor: textColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    ));
  }
}
        // : WillPopScope(
        //     onWillPop: () async => false,
        //     child: Scaffold(
        //       body: SafeArea(
        //         child: SizedBox(
        //           height: size.height,
        //           width: double.infinity,
        //         ),
        //       ),
        //     ),
        //   ),

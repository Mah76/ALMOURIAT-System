import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../Home/Drawer/home.dart';
import 'onbordingTest.dart';
import 'welcomPage.dart';

// class SplashTest extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: Lottie.asset('img/jsonImage/try3.json'),
//       nextScreen: OnboardeTest(),
//       splashIconSize: 250,
//       duration: 2000,
//       splashTransition: SplashTransition.fadeTransition,
//       //pageTransitionType: PageTransitionType.leftToRightWithFade,
//       animationDuration: const Duration(seconds: 2),
//     );
//   }
// }

class SplashPage extends StatelessWidget {
  final bool showOnBoard;
  const SplashPage({super.key, required this.showOnBoard});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset('img/jsonImage/try3.json'),
      nextScreen: FirebaseAuth.instance.currentUser != null
          ? const HomePagetest()
          : showOnBoard
              ? WelcomePage()
              : OnboardeTest(),
      splashIconSize: 250,
      duration: 2000,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: const Duration(seconds: 2),
    );
  }
}

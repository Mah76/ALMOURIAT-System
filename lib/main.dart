import 'package:final_project/appfiles/data/controllers/HorseController.dart';
import 'package:final_project/appfiles/data/controllers/Racescontroller.dart';
import 'package:final_project/appfiles/data/controllers/RegistrationController.dart';
import 'package:final_project/appfiles/data/controllers/RiderController.dart';
import 'package:final_project/appfiles/data/controllers/StableController.dart';
import 'package:final_project/appfiles/data/controllers/Trainercontroller.dart';
import 'package:final_project/appfiles/data/controllers/stagecontroller.dart';
import 'package:final_project/appfiles/data/models/registration.dart';
import 'package:final_project/route.dart';
import 'package:final_project/appfiles/data/repository/stagerepo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'appfiles/intro/splashPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:final_project/appfiles/data/helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  await Firebase.initializeApp();
  final firstTime =
      (await SharedPreferences.getInstance()).getBool('OnBoard') ?? false;
  runApp(FinalProject(showOnBoard: firstTime));
}

class FinalProject extends StatelessWidget {
  const FinalProject({super.key, required this.showOnBoard});
  final bool showOnBoard;
  @override
  Widget build(BuildContext context) {
    Get.find<RacesController>().getRaces();
    Get.find<StageController>().getStage();
    Get.find<HorseController>().getHorse();
    Get.find<RiderController>().getRider();
    Get.find<TrainerController>().getTrainer();
    Get.find<StableController>().getStable();
    Get.find<RegistrationController>();

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashPage(showOnBoard: showOnBoard),
            initialRoute: AppRoute.initial,
            getPages: AppRoute.routes,
          );
        });
  }
}

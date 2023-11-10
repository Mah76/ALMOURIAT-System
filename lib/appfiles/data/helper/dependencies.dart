import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:final_project/appfiles/data/controllers/HorseController.dart';
import 'package:final_project/appfiles/data/controllers/Racescontroller.dart';
import 'package:final_project/appfiles/data/controllers/RegistrationController.dart';
import 'package:final_project/appfiles/data/controllers/RiderController.dart';
import 'package:final_project/appfiles/data/controllers/StableController.dart';
import 'package:final_project/appfiles/data/controllers/Trainercontroller.dart';
import 'package:final_project/appfiles/data/controllers/stagecontroller.dart';
import 'package:final_project/appfiles/data/repository/horserepo.dart';
import 'package:final_project/appfiles/data/repository/racesrepo.dart';
import 'package:final_project/appfiles/data/repository/registerationrepo.dart';
import 'package:final_project/appfiles/data/repository/riderrepo.dart';
import 'package:final_project/appfiles/data/repository/stablerepo.dart';
import 'package:final_project/appfiles/data/repository/stagerepo.dart';
import 'package:final_project/appfiles/data/repository/trainerrepo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //APIclient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConsts.BASE_URL));
  //Repository
  Get.lazyPut(() => RacesRepository(apiclient: Get.find()));
  Get.lazyPut(() => StageRepository(apiclient: Get.find()));
  Get.lazyPut(() => HorseRepository(apiclient: Get.find()));
  Get.lazyPut(() => RiderRepository(apiclient: Get.find()));
  Get.lazyPut(() => TrainerRepository(apiclient: Get.find()));
  Get.lazyPut(() => StableRepository(apiclient: Get.find()));
  Get.lazyPut(() => RegistrationRepository(apiclient: Get.find()));

  //Controller
  Get.lazyPut(() => RacesController(racesrepository: Get.find()));
  Get.lazyPut(() => StageController(stagerepository: Get.find()));
  Get.lazyPut(() => HorseController(horserepository: Get.find()));
  Get.lazyPut(() => RiderController(riderrepository: Get.find()));
  Get.lazyPut(() => TrainerController(trainerrepository: Get.find()));
  Get.lazyPut(() => StableController(stablerepository: Get.find()));
  Get.lazyPut(() => RegistrationController(registrationrepository: Get.find()));
}

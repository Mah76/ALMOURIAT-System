import 'package:final_project/appfiles/data/models/registration.dart';
import 'package:final_project/appfiles/data/models/response.dart';
import 'package:final_project/appfiles/data/repository/registerationrepo.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController implements GetxService {
  final RegistrationRepository registrationrepository;

  RegistrationController({
    required this.registrationrepository,
  });

  bool _isloding = false;
  bool get isloding => _isloding;
  set isloding(bool value) {
    _isloding = value;
    update();
  }

  Future<ResponseModel> registration(
    RigstrationModel rigstration,
  ) async {
    _isloding = true;

    update();
    Response response = await registrationrepository.registration(rigstration);
    late ResponseModel responsemodel;
    if (response.statusCode == 200) {
      print(response);
      responsemodel = ResponseModel(true, response.body);
    } else {
      responsemodel = ResponseModel(false, response.statusText!);
      print("something went wrong controller");
    }
    _isloding = false;
    update();
    return responsemodel;
  }
}







  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
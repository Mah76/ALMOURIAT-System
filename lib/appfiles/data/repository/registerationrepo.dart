import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:final_project/appfiles/data/models/registration.dart';
import 'package:get/get.dart';

class RegistrationRepository {
  final ApiClient apiclient;

  RegistrationRepository({
    required this.apiclient,
  });

  Future<Response> registration(RigstrationModel rigstration) async {
    return await apiclient.postData(
        AppConsts.REGISTRATION_URL, rigstration.toJson());
  }
}

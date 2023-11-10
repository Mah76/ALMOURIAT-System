import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class RacesRepository extends GetxService {
  final ApiClient apiclient;
  RacesRepository({required this.apiclient});

  Future<Response> getRaces() async {
    return await apiclient.getData(AppConsts.RACE_URL);
  }
}

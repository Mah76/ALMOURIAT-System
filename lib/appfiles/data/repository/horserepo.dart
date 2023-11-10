import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class HorseRepository extends GetxService {
  final ApiClient apiclient;
  HorseRepository({required this.apiclient});

  Future<Response> getHorse() async {
    return await apiclient.getData(AppConsts.HORSES_URL);
  }
}

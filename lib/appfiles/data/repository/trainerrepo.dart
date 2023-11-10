import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class TrainerRepository extends GetxService {
  final ApiClient apiclient;
  TrainerRepository({required this.apiclient});

  Future<Response> getTrainer() async {
    return await apiclient.getData(AppConsts.TRAINERS_URL);
  }
}

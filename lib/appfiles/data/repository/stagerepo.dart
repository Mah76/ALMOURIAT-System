import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class StageRepository extends GetxService {
  final ApiClient apiclient;
  StageRepository({required this.apiclient});

  Future<Response> getStage() async {
    return await apiclient.getData(AppConsts.STAGES_URL);
  }
}

import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class RiderRepository extends GetxService {
  final ApiClient apiclient;
  RiderRepository({required this.apiclient});

  Future<Response> getRider() async {
    return await apiclient.getData(AppConsts.RIDERS_URL);
  }
}

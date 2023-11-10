import 'package:final_project/appfiles/data/API/api.dart';
import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';

class StableRepository extends GetxService {
  final ApiClient apiclient;
  StableRepository({required this.apiclient});

  Future<Response> getStable() async {
    return await apiclient.getData(AppConsts.STABLES_URL);
  }
}

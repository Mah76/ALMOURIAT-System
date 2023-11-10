import 'dart:core';

import 'package:final_project/appfiles/data/models/rider.dart';
import 'package:final_project/appfiles/data/repository/riderrepo.dart';
import 'package:get/get.dart';

class RiderController extends GetxController {
  bool isDataLoading = false;

  final RiderRepository riderrepository;
  RiderController({required this.riderrepository});

  List<RiderModel> ridermodel = [];
  Future<void> getRider() async {
    Response response = await riderrepository.getRider();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        ridermodel = list.map((e) => RiderModel.fromJson(e)).toList();
        print(ridermodel);
        isDataLoading = true;
        update();
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }
}

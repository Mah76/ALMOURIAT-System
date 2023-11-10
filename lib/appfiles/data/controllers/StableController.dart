import 'dart:core';

import 'package:final_project/appfiles/data/models/rider.dart';
import 'package:final_project/appfiles/data/models/stable.dart';
import 'package:final_project/appfiles/data/repository/riderrepo.dart';
import 'package:final_project/appfiles/data/repository/stablerepo.dart';
import 'package:get/get.dart';

class StableController extends GetxController {
  bool isDataLoading = false;

  final StableRepository stablerepository;
  StableController({required this.stablerepository});

  List<StableModel> stablemodel = [];
  Future<void> getStable() async {
    Response response = await stablerepository.getStable();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        stablemodel = list.map((e) => StableModel.fromJson(e)).toList();
        print(stablemodel);
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

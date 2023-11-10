import 'dart:core';

import 'package:final_project/appfiles/data/models/horse.dart';
import 'package:final_project/appfiles/data/repository/horserepo.dart';
import 'package:get/get.dart';

class HorseController extends GetxController {
  bool isDataLoading = false;

  final HorseRepository horserepository;
  HorseController({required this.horserepository});

  List<HorseModel> horsemodel = [];
  Future<void> getHorse() async {
    Response response = await horserepository.getHorse();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        horsemodel = list.map((e) => HorseModel.fromJson(e)).toList();
        print(horsemodel);
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

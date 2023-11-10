import 'dart:core';

import 'package:final_project/appfiles/data/models/horse.dart';
import 'package:final_project/appfiles/data/models/trainer.dart';
import 'package:final_project/appfiles/data/repository/horserepo.dart';
import 'package:final_project/appfiles/data/repository/trainerrepo.dart';
import 'package:get/get.dart';

class TrainerController extends GetxController {
  bool isDataLoading = false;

  final TrainerRepository trainerrepository;
  TrainerController({required this.trainerrepository});

  List<TrainerModel> trainermodel = [];
  Future<void> getTrainer() async {
    Response response = await trainerrepository.getTrainer();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        trainermodel = list.map((e) => TrainerModel.fromJson(e)).toList();
        print(trainermodel);
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

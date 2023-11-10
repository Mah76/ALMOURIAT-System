import 'dart:convert';
import 'dart:core';

import 'package:final_project/appfiles/data/models/race.dart';
import 'package:final_project/appfiles/data/models/stage.dart';
import 'package:final_project/appfiles/data/repository/racesrepo.dart';
import 'package:final_project/appfiles/data/repository/stagerepo.dart';
import 'package:get/get.dart';

class StageController extends GetxController {
  bool isDataLoading = false;

  final StageRepository stagerepository;
  StageController({required this.stagerepository});

  List<StageModel> stagemodel = [];
  Future<void> getStage() async {
    Response response = await stagerepository.getStage();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        stagemodel = list.map((e) => StageModel.fromJson(e)).toList();
        print(stagemodel);
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

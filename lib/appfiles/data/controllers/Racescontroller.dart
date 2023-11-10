import 'dart:convert';
import 'dart:core';

import 'package:final_project/appfiles/data/models/race.dart';
import 'package:final_project/appfiles/data/repository/racesrepo.dart';
import 'package:get/get.dart';

class RacesController extends GetxController {
  bool isDataLoading = false;
  int inListItems = 0;

  final RacesRepository racesrepository;
  RacesController({required this.racesrepository});

  List<ReaceModel> racemodel = [];
  Future<void> getRaces() async {
    Response response = await racesrepository.getRaces();
    try {
      if (response.statusCode == 200) {
        List<dynamic> list = response.body;
        racemodel = list.map((e) => ReaceModel.fromJson(e)).toList();
        print(racemodel);
        isDataLoading = true;
        update();
      } else {
        print("something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  void initList() {
    inListItems = 0;
  }
}

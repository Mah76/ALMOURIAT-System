import 'package:final_project/appfiles/data/models/list.dart';
import 'package:final_project/appfiles/data/repository/listrepo.dart';
import 'package:get/get.dart';

class RegistrationListController extends GetxService {
  final RegistrationListRepository registrationlistrepository;
  RegistrationListController({required this.registrationlistrepository});
  Map<int, RegistrationListModel> items = {};

  // void addRegister( )
}

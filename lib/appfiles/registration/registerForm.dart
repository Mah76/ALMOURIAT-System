// ignore_for_file: unrelated_type_equality_checks, prefer_const_constructors

import 'package:final_project/Const.dart';
import 'package:final_project/appfiles/data/controllers/HorseController.dart';
import 'package:final_project/appfiles/data/controllers/RegistrationController.dart';
import 'package:final_project/appfiles/data/controllers/user_controller.dart';
import 'package:final_project/appfiles/data/models/registration.dart';
import 'package:final_project/customSnackbar.dart';
import 'package:final_project/customWidget/customCircule.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../customWidget/customAppBar.dart';
import '../../customWidget/customButton.dart';

class FormRegistration extends StatefulWidget {
  const FormRegistration({
    Key? key,
    required this.raceid,
  }) : super(key: key);
  final int? raceid;

  @override
  State<FormRegistration> createState() => _FormRegistrationState();
}

class _FormRegistrationState extends State<FormRegistration> {
  String? scanResult;

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController(), tag: 'user');

    final GlobalKey<FormState> stageKey = GlobalKey<FormState>();
    String? stageValue;

    var riderController = TextEditingController();
    var trainerController = TextEditingController();
    // var stageController = TextEditingController();
    // var user_AccessToken = userController.currentUserModel.value?.uid ?? '';
    var stablename = userController.currentUserModel.value?.name ?? '';
    int? raceid = Get.arguments;

    //MVC way
    void rigstration(RegistrationController registrationController) {
      // var registrationController = Get.find<RegistrationController>();
      int horseid = int.parse(scanResult!);
      String trainerpassport = trainerController.text.trim();
      String riderpassport = riderController.text.trim();
      String stages = stageValue!;
      //stageController.text.trim();
      raceid = raceid;
      stablename;
      // user_AccessToken:
      // user_AccessToken;

      if (riderpassport.isEmpty) {
        CustomSanckbar("Please Type Rider Passport Number",
            title: "Rider Passport");
      } else if (trainerpassport.isEmpty) {
        CustomSanckbar("Please Type Trainer Passport Number",
            title: "Trainer Passport");
      } else if (stages.isEmpty) {
        CustomSanckbar("Please put the stage", title: "Stages");
      } else {
        // CustomSanckbar("Registration Successful", title: "Success");
        RigstrationModel rigstration = RigstrationModel(
          horse_id: horseid,
          race_id: raceid,
          rider_passport: riderpassport,
          stages: stages,
          stable_name: stablename,
          trainer_passport: trainerpassport,
          // user_AccessToken: user_AccessToken
        );
        registrationController.registration(rigstration).then((status) {
          if (status.isSuccess) {
            CustomSanckbar(
                "Registration Successful Please enter the rest participation",
                title: "Success");
            // Get.toNamed(AppRoute.getreceiptPage(
            //   raceid: raceid,
            //   horseid: horseid,
            //   riderpassport: riderpassport,
            //   trainerpassport: trainerpassport,
            //   stages: stages,
            //   stablename: stablename,
            // ));
          } else {
            CustomSanckbar(status.message);
          }
        });
        // print(rigstration.toString());
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Registration Form',
        isLeading: false,
      ),
      body: Theme(
        data: ThemeData(
          primarySwatch: Colors.red,
        ),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: GetBuilder<RegistrationController>(
                builder: (registrationController) {
              return !registrationController.isloding
                  ? ListView(
                      children: [
                        GetBuilder<HorseController>(
                          builder: (horsedata) {
                            var lengthID = horsedata.horsemodel.length;
                            return Column(
                              children: [
                                GestureDetector(
                                  onTap: scanBarcode,
                                  child: ImageIcon(
                                    AssetImage('img/barcode.png'),
                                    color: iconColor,
                                    size: 150,
                                  ),
                                ),
                                Gap(15),
                                Text(
                                  scanResult == null
                                      ? 'Scan Barcode!'
                                      : (int.parse(scanResult!)) > lengthID
                                          ? 'Barcode Not Found!'
                                          : scanResult ==
                                                  horsedata
                                                      .horsemodel[int.parse(
                                                              scanResult!) -
                                                          1]
                                                      .id
                                              ? 'Not Data Found'
                                              : 'Horse name & Vaccine date : ${horsedata.horsemodel[int.parse(scanResult!) - 1].name} & ${horsedata.horsemodel[int.parse(scanResult!) - 1].vaccineExpire}',
                                  style: mystyle15B,
                                ),
                              ],
                            );
                          },
                        ),
                        Gap(80),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Please fill the fields below",
                                  style: textSlestyle(context, iconColor, 17.sp,
                                      FontWeight.bold)),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                width: double.infinity,
                                decoration: BoxDecoration(),
                                child: Form(
                                  key: stageKey,
                                  child: DropdownButtonFormField<String>(
                                    isExpanded: true,
                                    validator: (value) {
                                      if (value == null) {
                                        return 'Please Selecte the stage';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                    ),
                                    hint: Text('Enter The Stage'),
                                    value: stageValue,
                                    onChanged: (newValue) {
                                      setState(() {
                                        stageValue = newValue!;
                                      });
                                    },
                                    items: const [
                                      DropdownMenuItem(
                                        value: '40KM',
                                        child: Text('40KM'),
                                      ),
                                      DropdownMenuItem(
                                        value: '60KM',
                                        child: Text('60KM'),
                                      ),
                                      DropdownMenuItem(
                                        value: '80KM',
                                        child: Text('80KM'),
                                      ),
                                      DropdownMenuItem(
                                        value: '120KM',
                                        child: Text('120KM'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 25),
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: riderController,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the Rider passport ID';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 1),
                                    ),
                                    labelText: "Rider Passport",
                                    hintText: 'A233222112',
                                  ),
                                ),
                              ),
                              Container(
                                // padding: EdgeInsets.only(left: 25),
                                margin: const EdgeInsets.only(bottom: 20),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextFormField(
                                  controller: trainerController,
                                  enabled: true,
                                  keyboardType: TextInputType.text,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the trainer passport ID';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide(
                                          color: Colors.green, width: 1),
                                    ),
                                    labelText: "Trainer Passport",
                                    hintText: 'A233222112',
                                  ),
                                ),
                              ),
                              CustomButton(
                                buttonText: 'Register',
                                buttonPressed: () {
                                  if (scanResult != null) {
                                    rigstration(registrationController);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : CustomLoader();
             
            }),
          ),
        ),
      ),
    );
  }

  Future scanBarcode() async {
    String scanResult;

    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#922d2e", "Cancel", true, ScanMode.QR);
    } on PlatformException {
      scanResult = 'Failed to get the barcode';
    }
    if (!mounted) return;
    setState(() => this.scanResult = scanResult);
  }
}




// ignore_for_file: non_constant_identifier_names

class RigstrationModel {
  int? horse_id;
  String? trainer_passport;
  String? rider_passport;
  // String? user_AccessToken;
  String? stable_name;
  String? stages;
  int? race_id;

  RigstrationModel({
    required this.horse_id,
    required this.stages,
    required this.trainer_passport,
    required this.rider_passport,
    // required this.user_AccessToken,
    required this.stable_name,
    required this.race_id,
  });

  RigstrationModel.fromJson(Map<String, dynamic> json) {
    RigstrationModel(
      horse_id: json['horse_id'],
      stages: json['stages'],
      trainer_passport: json['trainer_passport'],
      rider_passport: json['rider_passport'],
      // user_AccessToken: json['user_AccessToken'],
      race_id: json['race_id'],
      stable_name: json['stable_name'],
    );
  }

  Map<String, dynamic> toJson() => {
        "stable_name": stable_name,
        "race_id": race_id,
        "horse_id": horse_id,
        "rider_passport": rider_passport,
        "trainer_passport": trainer_passport,
        "stages": stages,
      };
}













  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['stable_name'] = this.stable_name;
  //   data['race_id '] = this.race_id;
  //   data['horse_id'] = this.horse_id;
  //   data['rider_passport'] = this.rider_passport;
  //   data['trainer_passport'] = this.trainer_passport;
  //   data['stages'] = this.stages;
  //   // data['Access Token'] = this.user_AccessToken;
  //   return data;
  // }

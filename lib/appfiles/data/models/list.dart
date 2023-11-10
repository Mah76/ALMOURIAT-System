class RegistrationListModel {
  int? id;
  int? raceid;
  int? horseId;
  String? stablename;
  String? trainername;
  String? ridername;
  String? stages;
  bool? isExit;
  String? time;

  RegistrationListModel(
      {this.id,
      this.raceid,
      this.horseId,
      this.stablename,
      this.trainername,
      this.ridername,
      this.stages,
      this.isExit = false,
      this.time});

  RegistrationListModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    raceid = json['raceid'];
    horseId = json['horseId'];
    stablename = json['stablename'];
    trainername = json['trainername'];
    ridername = json['ridername'];
    stages = json['stages'];
    isExit = json['isExit'];
    time = json['time'];

    // Map<String, dynamic> toJson() {
    //   final Map<String, dynamic> data = new Map<String, dynamic>();
    //   data['id'] = this.id;
    //   data['name'] = this.name;
    //   data['date'] = this.date;
    //   data['img'] = this.img;
    //   data['created_at'] = this.createdAt;
    //   data['updated_at'] = this.updatedAt;
    //   return data;
    // }
  }
}

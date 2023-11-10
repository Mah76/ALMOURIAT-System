class HorseModel {
  int? id;
  String? name;
  String? vaccineExpire;
  String? dOB;
  int? stableId;
  int? trainerId;
  String? createdAt;
  String? updatedAt;

  HorseModel(
      {this.id,
      this.name,
      this.vaccineExpire,
      this.dOB,
      this.stableId,
      this.trainerId,
      this.createdAt,
      this.updatedAt});

  HorseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vaccineExpire = json['vaccine_expire'];
    dOB = json['DOB'];
    stableId = json['stable_id'];
    trainerId = json['trainer_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

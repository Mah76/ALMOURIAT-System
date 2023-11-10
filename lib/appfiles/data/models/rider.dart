class RiderModel {
  int? id;
  String? name;
  String? passport;
  String? licenseExpire;
  int? stableId;
  String? createdAt;
  String? updatedAt;

  RiderModel(
      {this.id,
      this.name,
      this.passport,
      this.licenseExpire,
      this.stableId,
      this.createdAt,
      this.updatedAt});

  RiderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    passport = json['passport'];
    licenseExpire = json['license_expire'];
    stableId = json['stable_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

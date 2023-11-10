class TrainerModel {
  int? id;
  String? name;
  String? passport;
  String? createdAt;
  String? updatedAt;

  TrainerModel(
      {this.id, this.name, this.passport, this.createdAt, this.updatedAt});

  TrainerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    passport = json['passport'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

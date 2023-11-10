class StableModel {
  int? id;
  String? name;
  int? phone;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? email;

  StableModel(
      {this.id,
      this.name,
      this.phone,
      this.createdAt,
      this.updatedAt,
      this.accessToken,
      this.email});

  StableModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
    email = json['email'];
  }
}

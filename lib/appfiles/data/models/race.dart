class ReaceModel {
  int? id;
  String? name;
  String? date;
  String? img;
  String? createdAt;
  String? updatedAt;

  ReaceModel(
      {this.id,
      this.name,
      this.date,
      this.img,
      this.createdAt,
      this.updatedAt});

  ReaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    date = json['date'];
    img = json['img'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];

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

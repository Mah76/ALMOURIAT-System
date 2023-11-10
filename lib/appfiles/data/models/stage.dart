class StageModel {
  int? id;
  int? raceId;
  String? distance;
  String? createdAt;
  String? updatedAt;

  StageModel(
      {this.id, this.distance, this.raceId, this.createdAt, this.updatedAt});

  StageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    distance = json['distance'];
    raceId = json['race_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

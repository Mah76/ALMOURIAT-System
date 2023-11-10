import 'dart:convert';

class UserModel {
  String? phone;
  String? name;
  String? uid;
  UserModel({
    this.phone,
    this.name,
    this.uid,
  });
  UserModel copyWith({
    String? phone,
    String? name,
    String? uid,
  }) {
    return UserModel(
      phone: phone ?? this.phone,
      name: name ?? this.name,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Phone': phone,
      'name': name,
      'uid': uid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      phone: map['Phone'],
      name: map['name'],
      uid: map['uid'],
    );
  }
  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
  @override
  String toString() => 'UserModel(Phone: $phone, name: $name, uid: $uid)';
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserModel &&
        other.phone == phone &&
        other.name == name &&
        other.uid == uid;
  }

  @override
  int get hashCode => phone.hashCode ^ name.hashCode ^ uid.hashCode;
}

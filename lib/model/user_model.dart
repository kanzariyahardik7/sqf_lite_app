class UserModel {
  int? id;
  String? name;
  int? age;
  UserModel({this.id, this.name, this.age});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(id: map['id'], name: map['name'], age: map['age']);
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age};
  }
}

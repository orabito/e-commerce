class UserEntity {

  String? name;
  String? email;
  String? role;
  UserEntity.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['role'] = this.role;
    return data;
  }
  UserEntity({this.name, this.email, this.role});


}

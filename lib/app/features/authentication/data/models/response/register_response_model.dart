class RegisterResponseModel {
  bool? success;
  User? user;
  String? accessToken;

  RegisterResponseModel({this.success, this.user, this.accessToken});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
  }
  
}

class User {
  String? id;
  String? userName;
  String? email;
  String? role;

  User({this.id, this.userName, this.email, this.role});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    role = json['role'];
  }

}
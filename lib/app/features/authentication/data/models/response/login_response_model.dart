class LoginResponseModel {
  String? message;
  User? user;
  String? accessToken;

  LoginResponseModel({this.message, this.user, this.accessToken});

  String get displayName => user?.userName ?? "User";

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      message: json['message'],
      accessToken: json['accessToken'],
      user: json['user'] != null
          ? User.fromJson(json['user'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'accessToken': accessToken,
      'user': user?.toJson(),
    };
  }
}

class User {
  final String id;
  final String userName;
  final String email;
  final String role;

  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userName': userName,
      'email': email,
      'role': role,
    };
  }
}
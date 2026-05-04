class RegisterRequestModel {
  String? userName;
  String? email;
  String? password;

  RegisterRequestModel({this.userName, this.email, this.password});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}

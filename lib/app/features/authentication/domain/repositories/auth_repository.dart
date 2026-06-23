// import 'package:evoliving/app/core/network/models/token_storage.dart';
// import 'package:evoliving/app/core/network/result_api.dart';
// import 'package:evoliving/app/features/authentication/data/api/auth_api.dart';
// import 'package:evoliving/app/features/authentication/data/models/request/login_request_model.dart';
// import 'package:evoliving/app/features/authentication/data/models/response/login_response_model.dart';

// class AuthRepository {
//   final TokenStorage storage;

//   AuthRepository(this.storage);

//   Future<LoginResponseModel> login(LoginRequestModel email, String password) async {
//     final result = await AuthApi.loginAuth(email, password);

//     if (result is SuccessApi<LoginResponseModel>) {
//       final token = result.data.accessToken;

//       if (token != null) {
//         await storage.saveToken(token);
//       }

//       return result.data;
//     } else {
//       throw Exception((result as ErrorApi).messageError);
//     }
//   }

//   Future<bool> isLoggedIn() async {
//     final token = await storage.getToken();
//     return token != null;
//   }

//   Future<void> logout() async {
//     await storage.deleteToken();
//   }
// }
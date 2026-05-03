import 'dart:convert';
import 'package:evoliving/app/core/network/end_points.dart';
import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/authentication/data/models/request/login_request_model.dart';
import 'package:evoliving/app/features/authentication/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthApi {
  static Future<ResultApi<LoginResponseModel>> loginAuth(
    LoginRequestModel loginRequestModel,
  ) async {
    Uri url = Uri.https(Endpoints.baseUrl, Endpoints.login);

    try {
      var response = await http.post(
        url,
        body: loginRequestModel.toJson(),
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return SuccessApi(LoginResponseModel.fromJson(json));
      } else {
        return ErrorApi(json['message'] ?? "Login failed");
      }
    } catch (e) {
      return ErrorApi(e.toString());
    }
  }
}

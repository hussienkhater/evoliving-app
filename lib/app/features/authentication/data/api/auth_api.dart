import 'dart:convert';
import 'package:evoliving/app/core/network/end_points.dart';
import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/authentication/data/models/request/login_request_model.dart';
import 'package:evoliving/app/features/authentication/data/models/request/register_request_model.dart';
import 'package:evoliving/app/features/authentication/data/models/response/login_response_model.dart';
import 'package:evoliving/app/features/authentication/data/models/response/register_response_model.dart';
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

  static Future<ResultApi<RegisterResponseModel>> registerAuth(
    RegisterRequestModel registerRequestModel) async {

  Uri url = Uri.https(Endpoints.baseUrl, Endpoints.signUp);

  try {
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(registerRequestModel.toJson()), // 🔥 أهم تعديل
    );

    final json = jsonDecode(response.body);

    print("STATUS: ${response.statusCode}");
    print("BODY: ${response.body}");

    if (response.statusCode == 200 || response.statusCode == 201) {
      return SuccessApi(RegisterResponseModel.fromJson(json));
    } else {
      return ErrorApi(json['message'] ?? "Registration failed");
    }
  } catch (e) {
    return ErrorApi(e.toString());
  }
}
}

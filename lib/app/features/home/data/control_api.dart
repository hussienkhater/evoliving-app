import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:evoliving/app/core/network/end_points.dart';
import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/home/domain/model/request/control_device_request_model.dart';
import 'package:evoliving/app/features/home/domain/model/response/control_device_response_model.dart';

abstract class ControlApi {
  static Future<ResultApi<ControlDeviceResponseModel>> controlDevice(
  ControlDeviceRequestModel request,
) async {
  Uri url = Uri.https(
    Endpoints.baseUrl2,
    Endpoints.controlDevice, 
  );

  try {
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(request.toJson()),
    );

    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return SuccessApi(ControlDeviceResponseModel.fromJson(json));
    } else {
      return ErrorApi(json['message'] ?? "Control device failed");
    }
  } catch (e) {
    return ErrorApi(e.toString());
  }
}

static Future<ResultApi<List<ControlDeviceResponseModel>>> getDevicesStatus() async {
  Uri url = Uri.https(
    Endpoints.baseUrl2,
    Endpoints.getDeviceStatus, 
  );

  try {
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );

    final json = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final List data = json;

      return SuccessApi(
        data.map((e) => ControlDeviceResponseModel.fromJson(e)).toList(),
      );
    } else {
      return ErrorApi(json['message'] ?? "Failed to load devices");
    }
  } catch (e) {
    return ErrorApi(e.toString());
  }
}
}
import 'dart:convert';
import 'package:evoliving/app/core/network/end_points.dart';
import 'package:evoliving/app/core/network/result_api.dart';
import 'package:evoliving/app/features/control/data/models/sensor_response_model.dart';
import 'package:http/http.dart' as http;

abstract class SensorApi {
  static Future<ResultApi<SensorResponseModel>> getLatestSensorData() async {
    Uri url = Uri.http(
      Endpoints.baseUrl2,
      Endpoints.getLatestSensorData,
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
        return SuccessApi(
          SensorResponseModel.fromJson(json),
        );
      } else {
        return ErrorApi(
          json['message'] ?? "Failed to load sensor data",
        );
      }
    } catch (e) {
      return ErrorApi(e.toString());
    }
  }
}
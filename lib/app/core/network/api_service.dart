import 'package:dio/dio.dart';

import 'dio_client.dart';
import 'exceptions/server_exception.dart';


class ApiService {
  final DioClient dioClient;
  ApiService(this.dioClient);

  Future<Response> getData(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dioClient.dio.get(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<Response> postData(String endpoint, {required  data}) async {
    try {
      final response = await dioClient.dio.post(endpoint, data: data);

      if (response.statusCode == 302) {
        throw Exception("Redirect Detected! Check API URL and Authentication.");
      }

      return response;
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<Response> putData(String endpoint, {required Map<String, dynamic> data}) async {
    try {
      final response = await dioClient.dio.put(endpoint, data: data);
      return response;
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }

  Future<Response> deleteData(String endpoint, {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await dioClient.dio.delete(endpoint, queryParameters: queryParams);
      return response;
    } on DioException catch (e) {
      throw ServerException.fromDioError(e);
    }
  }
}
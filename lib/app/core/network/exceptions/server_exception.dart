import 'package:dio/dio.dart';

class ServerException implements Exception {
  final String message;
  ServerException(this.message);

  factory ServerException.fromDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException('Connection timeout, please try again.');
      case DioExceptionType.receiveTimeout:
        return ServerException('Receive timeout, please try again.');
      case DioExceptionType.badResponse:
        return ServerException(
            'Error: ${error.response?.statusCode} - ${error.response?.statusMessage}');
      default:
        return ServerException('Something went wrong, please try again.');
    }
  }
}
import 'package:dio/dio.dart';
import 'end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio dio = Dio(BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    headers: {'Content-Type': 'application/json'},
    followRedirects: false,
    validateStatus: (status) {
      return status! < 500;
    },
  ));

  DioClient() {
    dio.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false, // قلل الضوضاء بإخفاء الهيدر في الاستجابة
        error: true,
        compact: true, // يجعل الإخراج مضغوطًا وأكثر وضوحًا
        maxWidth: 90, // يقلل عرض السجلات لعرض أفضل في الكونسول

      ),
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers.addAll({
            'Accept': 'application/json', // 🚀 هذا مهم لضمان أن الاستجابة تكون بصيغة JSON
            // 'Authorization': 'Bearer YOUR_TOKEN'
          });

          return handler.next(options);
        },
        onError: (DioException e, handler) {
          handler.next(e);
        },
      ),
    ]);
  }
}

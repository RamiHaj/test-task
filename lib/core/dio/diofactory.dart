import 'package:dio/dio.dart';
import 'package:test_task/core/dio/request_interceptor.dart';

class DioFactory {
  static String baseUrl = "https://flutter-task-hala-tech.herokuapp.com";
  static String apiUrl = baseUrl;
  static Dio dioSetUp() {
    BaseOptions options = BaseOptions(
      baseUrl: apiUrl,
      sendTimeout: 20000,
      connectTimeout: 20000,
      receiveTimeout: 40000,
      contentType: "application/json",
    );
    Dio dio = Dio(options);
    dio.interceptors.addAll([
      RequestInterceptor(),
    ]);
    return dio;
  }
}

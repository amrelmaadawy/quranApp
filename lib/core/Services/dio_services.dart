import 'package:dio/dio.dart';

class DioServises {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://api.aladhan.com/v1/timingsByCity/"),
  );

  Future<Response> getData(String path) async {
    return _dio.get(path);
  }
}

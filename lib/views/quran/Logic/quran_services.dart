import 'package:dio/dio.dart';

class QuranServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "http://api.alquran.cloud/v1/"),
  );

  Future<Response> getData(String path) async {
    return _dio.get(path);
  }
}

import 'package:dio/dio.dart';

class HadithServices {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: "https://hadis-api-id.vercel.app/hadith/"),
  );

  Future<Response> getData(String path) async {
    return _dio.get(path);
  }
}

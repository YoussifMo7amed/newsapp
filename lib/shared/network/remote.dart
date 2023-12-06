import 'package:dio/dio.dart';

class DioHelper {
  static Dio ?dio;
  static init() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
  }
  static Future<Response> getBoolean({
      required String url,
      required Map<String, dynamic> queries,
    }) async {
      return await dio!.get(
        url,
        queryParameters: queries,
      );
    }
}
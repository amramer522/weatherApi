import 'package:dio/dio.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: "https://api.openweathermap.org/data/2.5/",
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData({dynamic queryParameters}) async {
    return await dio.get("weather", queryParameters: queryParameters);
  }
}

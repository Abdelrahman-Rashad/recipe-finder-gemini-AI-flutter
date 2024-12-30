import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioHelperQwen {
  static late Dio dio;

  static init(String baseUrl) {
    dio = Dio(BaseOptions(baseUrl: dotenv.env[baseUrl]!));
  }

  static Future<Response> getData(
      {required String endpoint,
      String? token,
      Map<String, dynamic>? body}) async {
    dio.options.headers = {
      'Authorization': "Bearer $token",
    };
    Response response = await dio.get(endpoint, queryParameters: body);
    return response;
  }

  static Future<Response?> postData(
      {required String endpoint,
      Map<String, dynamic>? body,
      String? token}) async {
    dio.options.headers = {
      'Authorization': "Bearer $token",
    };
    try {
      Response response = await dio.post(endpoint, data: body);
      return response;
    } on DioException catch (e) {
      return e.response;
    }
  }
}

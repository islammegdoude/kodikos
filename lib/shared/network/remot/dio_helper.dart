
import 'package:dio/dio.dart';

import '../end-points/endPoints.dart';

class DioHelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String, dynamic>? query,
    
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    return dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    return dio!.put(url, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String? token,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'application/json',
      'token': token,
    };
    return dio!.delete(url, queryParameters: query, data: data);
  }

  static Future<Response> uploadImage({
    required String url,
    required FormData? data,
  }) async {
    dio?.options.headers = {
      'Content-Type': 'multipart/form-data',
    };
    return dio!.post(url, data: data);
  }
}
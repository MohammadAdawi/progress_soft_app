import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import '../endpoints/endpoints.dart';

class DioClient {
  static CancelToken cancelToken = CancelToken();
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(minutes: 1),
        receiveTimeout: const Duration(minutes: 1),
        headers: {
          // 'authorization' : basicAuth,
          'Accept': '*/*',
        },
      ),
    );

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {

          return handler.next(options);
        },
        onResponse: (ex, handler) {
          return handler.next(ex);
        },
        onError: (ex, handler) async {
      
          return handler.next(ex);
        },
      ),
    );
  }

//GET Method
  static Future<Response> get({
    required url,
    Map<String, dynamic>? queryParams,
    String? accessToken,
  }) async {
    Response response;
    try {
      // print("Access Token: ${PreferenceUtils.getString("accessToken")}");

      response = await dio!.get(
        url,
        queryParameters: queryParams,
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $accessToken',
        //     'Content-Type': 'application/json',
        //   },
        // ),
        cancelToken: cancelToken,
      );
      //
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        //
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        //
      } else if (e.response?.statusCode == 500) {
        //
      } else {
        //
      }
      response = e.response!;
    }
    return response;
  }

// POST Method
  static Future<Response> post({
    required url,
    required dynamic body,
    Map<String, dynamic>? queryParams,
    String? accessToken,
  }) async {
    Response response;
    try {
      log(jsonEncode(body));
      // log(jsonDecode(body));

      response = await dio!.post(
        url,
        data: body,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        //
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        //
      } else if (e.response?.statusCode == 500 ||
          e.response?.statusCode == 406) {
        //
      } else {
        throw Exception();
      }
      // log(e.response.toString());
      response = e.response!;
    }
    return response;
  }

  static Future<Response> delete({
    required url,
    Map<String, dynamic>? queryParams,
    String? accessToken,
  }) async {
    Response response;
    try {
      response = await dio!.delete(
        url,
        queryParameters: queryParams,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        //
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        //
      } else if (e.response?.statusCode == 500) {
        //
      } else {
        throw Exception();
      }
      // log(e.response.toString());
      response = e.response!;
    }

    return response;
  }


}

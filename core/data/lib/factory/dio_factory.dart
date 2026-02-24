import 'package:data/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory();

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      // TODO: GET ACCESS TOKEN AND APP LANGUAGE
      authorization: 'your_access_token',
      defaultLanguage: 'app_laguange',
      clientId: 'your_client_id',
    };

    dio.options = BaseOptions(
      baseUrl: 'https://api.yourservice.com',
      headers: headers,
      receiveTimeout: const Duration(seconds: 60),
    );

    if (!kReleaseMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
      ));
    }

    return dio;
  }
}

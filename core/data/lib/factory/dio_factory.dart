import 'package:data/constants/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  const DioFactory(
    this.baseUrl,
    this.accessToken,
    this.language,
  );

  final String baseUrl;
  final String accessToken;
  final String language;

  Future<Dio> getDio() async {
    Dio dio = Dio();
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      // TODO: GET ACCESS TOKEN AND APP LANGUAGE
      authorization: accessToken,
      defaultLanguage: language,
      clientId: 'your_client_id',
    };

    dio.options = BaseOptions(
      baseUrl: baseUrl,
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

import 'package:data/factory/dio_factory.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // provide base url
  @Named('BaseUrl')
  String get baseUrl => 'https://api.yourservice.com';

  @Named('AccessToken')
  Future<String> get accessToken async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token') ?? '';
  }

  @Named('Language')
  Future<String> get language async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'en';
  }

  Future<Dio> dio(
    @Named('BaseUrl') baseUrl,
    @Named('AccessToken') Future<String> accessToken,
    @Named('Language') Future<String> language,
  ) async {
    final dioFactory = DioFactory(baseUrl, await accessToken, await language);
    return dioFactory.getDio();
  }
}

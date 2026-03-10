import 'package:data/di/data_module_keys.dart';
import 'package:data/factory/dio_factory.dart';
import 'package:datastore/provider/preferences_provider.dart';
import 'package:datastore/provider/session_provider.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  IPreferencesProvider providePreferencesProvider(SharedPreferences prefs) =>
      PreferencesProvider(prefs);

  // provide base url
  @Named(DataModuleKeys.baseUrl)
  String provideBaseUrl(IPreferencesProvider prefs) => prefs.getBaseUrl();

  @Named(DataModuleKeys.accessToken)
  String provideAccessToken(ISessionProvider sessionProvider) =>
      sessionProvider.getAccessToken();

  @Named(DataModuleKeys.language)
  String provideLanguage(IPreferencesProvider prefs) => prefs.getAppLanguage();

  @lazySingleton
  Future<Dio> dio(
    @Named(DataModuleKeys.baseUrl) baseUrl,
    @Named(DataModuleKeys.accessToken) String accessToken,
    @Named(DataModuleKeys.language) String language,
  ) async {
    final dioFactory = DioFactory(baseUrl, accessToken, language);
    return dioFactory.getDio();
  }
}

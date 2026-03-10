import 'package:datastore/provider/session_strings.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

abstract class ISessionProvider {
  String getClientId();
  String getUserId();
  String getAccessToken();
  String getRefreshToken();

  void setUserId(String userId);
  void setAccessToken(String accessToken);
  void setRefreshToken(String refreshToken);
}

@Injectable(as: ISessionProvider, env: [Environment.prod])
class SessionProviderProd implements ISessionProvider {
  const SessionProviderProd({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  String getAccessToken() {
    return sharedPreferences.getString(SessionStrings.accessTokenkey) ?? '';
  }

  @override
  String getClientId() {
    return "client_id_prod";
  }

  @override
  String getRefreshToken() {
    return sharedPreferences.getString(SessionStrings.refreshTokenkey) ?? '';
  }

  @override
  String getUserId() {
    return sharedPreferences.getString(SessionStrings.userIdKey) ?? '';
  }

  @override
  void setAccessToken(String accessToken) {
    sharedPreferences.setString(SessionStrings.accessTokenkey, accessToken);
  }

  @override
  void setRefreshToken(String refreshToken) {
    sharedPreferences.setString(SessionStrings.refreshTokenkey, refreshToken);
  }

  @override
  void setUserId(String userId) {
    sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }
}

@Injectable(as: ISessionProvider, env: [Environment.dev])
class SessionProviderDev implements ISessionProvider {
  const SessionProviderDev({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  @override
  String getAccessToken() {
    return sharedPreferences.getString(SessionStrings.accessTokenkey) ?? '';
  }

  @override
  String getClientId() {
    return Uuid().v4();
  }

  @override
  String getRefreshToken() {
    return sharedPreferences.getString(SessionStrings.refreshTokenkey) ?? '';
  }

  @override
  String getUserId() {
    return sharedPreferences.getString(SessionStrings.userIdKey) ?? '';
  }

  @override
  void setAccessToken(String accessToken) {
    sharedPreferences.setString(SessionStrings.accessTokenkey, accessToken);
  }

  @override
  void setRefreshToken(String refreshToken) {
    sharedPreferences.setString(SessionStrings.refreshTokenkey, refreshToken);
  }

  @override
  void setUserId(String userId) {
    sharedPreferences.setString(SessionStrings.userIdKey, userId);
  }
}

import 'package:injectable/injectable.dart';

abstract class ISessionProvider {
  String getClientId();
  String getUserId();
  String getAcessToken();
  String getRefreshToken();
}

@Injectable(as: ISessionProvider, env: [Environment.prod])
class SessionProviderProd implements ISessionProvider {
  @override
  String getAcessToken() {
    return "access_token_prod";
  }

  @override
  String getClientId() {
    return "client_id_prod";
  }

  @override
  String getRefreshToken() {
    return "refresh_token_prod";
  }

  @override
  String getUserId() {
    return "user_id_prod";
  }
}

@Injectable(as: ISessionProvider, env: [Environment.dev])
class SessionProviderDev implements ISessionProvider {
  @override
  String getAcessToken() {
    return "access_token_dev";
  }

  @override
  String getClientId() {
    return "client_id_dev";
  }

  @override
  String getRefreshToken() {
    return "refresh_token_dev";
  }

  @override
  String getUserId() {
    return "user_id_dev";
  }
}

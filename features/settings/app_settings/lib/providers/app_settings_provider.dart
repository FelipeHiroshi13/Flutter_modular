import 'package:injectable/injectable.dart';

abstract class IAppSettingsProvider {
  String getAppLanguage();

  String themeType();
}

@Injectable(as: IAppSettingsProvider, env: [Environment.prod])
class AppSettingsProvider implements IAppSettingsProvider {
  @override
  String getAppLanguage() {
    return 'English';
  }

  @override
  String themeType() {
    return 'Dark';
  }
}

@Injectable(as: IAppSettingsProvider, env: [Environment.dev])
class AppSettingsProviderDev implements IAppSettingsProvider {
  @override
  String getAppLanguage() {
    return 'Arabic';
  }

  @override
  String themeType() {
    return 'light';
  }
}

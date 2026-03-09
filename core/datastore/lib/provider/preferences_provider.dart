import 'package:datastore/provider/pref_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IPreferencesProvider {
  String getAppLanguage();

  String getBaseUrl();

  void setAppLanguage(String language);

  void setBaseUrl(String url);
}

class PreferencesProvider implements IPreferencesProvider {
  const PreferencesProvider(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  @override
  String getAppLanguage() {
    return _sharedPreferences.getString(PrefStrings.appLanguageKey) ??
        PrefStrings.appLanguageDefault;
  }

  @override
  String getBaseUrl() {
    return _sharedPreferences.getString(PrefStrings.baseUrlKey) ??
        PrefStrings.baseUrlDefault;
  }

  @override
  void setAppLanguage(String language) {
    _sharedPreferences.setString(PrefStrings.appLanguageKey, language);
  }

  @override
  void setBaseUrl(String url) {
    _sharedPreferences.setString(PrefStrings.baseUrlKey, url);
  }
}

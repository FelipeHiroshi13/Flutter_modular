import 'package:datastore/provider/preferences_provider.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class DataStoreModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @lazySingleton
  IPreferencesProvider providePreferencesProviderImpl(
          SharedPreferences prefs) =>
      PreferencesProvider(prefs);

// todo check me if still need it
// @lazySingleton
// SessionProvider provideSessionProviderImpl(SharedPreferences prefs) =>
//     SessionProviderImpl(prefs);
}

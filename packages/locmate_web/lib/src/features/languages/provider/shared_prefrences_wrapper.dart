import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rx_shared_preferences/rx_shared_preferences.dart';
part 'shared_prefrences_wrapper.g.dart';

@Riverpod(keepAlive: true)
SharedPrefrencesWrapper sharedPrefrencesWrapper(_) => SharedPrefrencesWrapper();

class SharedPrefrencesWrapper {
  final _prefs = RxSharedPreferences.getInstance();

  Future<int?> getInt(String key) {
    return _prefs.getInt(key);
  }

  Future<void> setInt(String key, int? value) {
    return _prefs.setInt(key, value);
  }

  Future<String?> getString(String key) {
    return _prefs.getString(key);
  }

  Future<void> setString(String key, String? value) {
    return _prefs.setString(key, value);
  }

  Future<void> remove(String key) {
    return _prefs.remove(key);
  }

  Future<Set<String>> getKeys() {
    return _prefs.getKeys();
  }
}

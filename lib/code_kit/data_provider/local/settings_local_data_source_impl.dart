part of '../../code_kit.dart';

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> changeBoolValue({
    required String key,
    required bool value,
  }) async =>
      sharedPreferences.setBool(key, value);

  @override
  Future<bool?> getBoolValue({required String key}) async =>
      sharedPreferences.getBool(key);

  @override
  Future<void> changeStringValue(
          {required String key, required String value}) async =>
      sharedPreferences.setString(key, value);

  @override
  Future<String?> getStringValue({
    required String key,
  }) async =>
      sharedPreferences.getString(key);
}

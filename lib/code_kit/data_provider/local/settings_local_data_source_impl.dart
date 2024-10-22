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
}

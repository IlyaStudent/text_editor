part of '../code_kit.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource settingsLocalDataSource;

  SettingsRepositoryImpl({required this.settingsLocalDataSource});

  @override
  Future<void> changeBoolValue({
    required String key,
    required bool value,
  }) async =>
      settingsLocalDataSource.changeBoolValue(
        key: key,
        value: value,
      );

  @override
  Future<bool> getBoolValue({required String key}) async {
    return await settingsLocalDataSource.getBoolValue(key: key) ?? true;
  }
}

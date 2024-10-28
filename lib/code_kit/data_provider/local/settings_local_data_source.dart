part of '../../code_kit.dart';

abstract class SettingsLocalDataSource {
  Future<void> changeBoolValue({
    required String key,
    required bool value,
  });

  Future<bool?> getBoolValue({
    required String key,
  });

  Future<void> changeStringValue({
    required String key,
    required String value,
  });

  Future<String?> getStringValue({
    required String key,
  });
}

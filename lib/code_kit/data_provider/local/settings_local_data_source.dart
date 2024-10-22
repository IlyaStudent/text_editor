part of '../../code_kit.dart';

abstract class SettingsLocalDataSource {
  Future<void> changeBoolValue({
    required String key,
    required bool value,
  });

  Future<bool?> getBoolValue({
    required String key,
  });
}

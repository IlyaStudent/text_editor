part of '../../settings.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial({
    @Default(true) bool onlineMode,
    @Default(true) bool encryptionMode,
  }) = _Initial;
  const factory SettingsState.loading() = _Loading;
  const factory SettingsState.actionCompleted({required bool signedOut}) =
      _ActionCompleted;
}

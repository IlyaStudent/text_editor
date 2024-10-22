part of '../../settings.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadSettingsData() = _LoadSettingsDataEvent;
  const factory SettingsEvent.signOut() = _SignOutEvent;
  const factory SettingsEvent.deleteAllData() = _DeleteAllDataEvent;
  const factory SettingsEvent.changeMode({
    required String changedValue,
    required bool value,
  }) = _ChangeModeEvent;
}

part of '../../settings.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.signOut() = _SignOutEvent;
}

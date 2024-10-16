part of '../../registration.dart';

@freezed
class RegistrationEvent with _$RegistrationEvent {
  const factory RegistrationEvent.register() = _RegisterEvent;
  const factory RegistrationEvent.changeData({
    required String changedFieldName,
    required String changedFieldText,
  }) = _ChangeDataEvent;
}

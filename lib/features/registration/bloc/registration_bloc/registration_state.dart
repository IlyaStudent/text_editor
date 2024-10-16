part of '../../registration.dart';

@freezed
class RegistrationState with _$RegistrationState {
  const factory RegistrationState.checkingData({
    @Default(RegistrationErrorDTO()) RegistrationErrorDTO registrationErrorDTO,
    @Default(RegistrationDTO()) RegistrationDTO registrationDTO,
  }) = _CheckingData;
  const factory RegistrationState.loading() = _Loading;
  const factory RegistrationState.registered() = _Registered;
}

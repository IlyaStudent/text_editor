part of '../../registration.dart';

@freezed
class RegistrationErrorDTO extends RegistrationErrorEntity
    with _$RegistrationErrorDTO {
  const factory RegistrationErrorDTO({
    @Default(false) bool isValid,
    @Default(false) bool userAlreadyRegisteredError,
    @Default(false) bool invalidDataError,
    bool? email,
    bool? plainPassword,
    bool? confirmPassword,
  }) = _RegistrationErrorDTO;

  factory RegistrationErrorDTO.fromJson(Map<String, dynamic> json) =>
      _$RegistrationErrorDTOFromJson(json);
}

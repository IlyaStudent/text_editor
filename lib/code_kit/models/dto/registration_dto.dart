part of '../../code_kit.dart';

@freezed
class RegistrationDTO extends RegistrationEntity with _$RegistrationDTO {
  const factory RegistrationDTO({
    final String? email,
    final String? plainPassword,
    final String? confirmPassword,
  }) = _RegistrationDTO;

  factory RegistrationDTO.fromJson(Map<String, dynamic> json) =>
      _$RegistrationDTOFromJson(json);
}

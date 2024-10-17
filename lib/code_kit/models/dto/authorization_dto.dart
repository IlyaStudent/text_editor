part of '../../code_kit.dart';

@freezed
class AuthorizationDTO extends AuthorizationEnity with _$AuthorizationDTO {
  const factory AuthorizationDTO({
    String? email,
    String? password,
  }) = _AuthorizationDTO;

  factory AuthorizationDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationDTOFromJson(json);
}

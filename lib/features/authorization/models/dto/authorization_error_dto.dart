part of '../../authorization.dart';

@freezed
class AuthorizationErrorDTO extends AuthorizationErrorEntity
    with _$AuthorizationErrorDTO {
  const factory AuthorizationErrorDTO({
    @Default(false) bool isValid,
    @Default(true) bool email,
    @Default(true) bool password,
    @Default(false) bool signInError,
  }) = _AuthorizationErrorDTO;

  factory AuthorizationErrorDTO.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationErrorDTOFromJson(json);
}
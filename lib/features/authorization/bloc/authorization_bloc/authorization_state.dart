part of '../../authorization.dart';

@freezed
class AuthorizationState with _$AuthorizationState {
  const factory AuthorizationState.checkingData({
    @Default(
      AuthorizationDTO(),
    )
    AuthorizationDTO authorizationDTO,
    @Default(
      AuthorizationErrorDTO(),
    )
    AuthorizationErrorDTO authorizationErrorDTO,
  }) = _CheckingData;
  const factory AuthorizationState.loading() = _Loading;
  const factory AuthorizationState.authorized() = _Authorized;
}

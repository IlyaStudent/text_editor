part of '../../authorization.dart';

@freezed
class AuthorizationEvent with _$AuthorizationEvent {
  const factory AuthorizationEvent.authorize() = _AuthorizeEvent;
  const factory AuthorizationEvent.changeData({
    required String changedFieldName,
    required String changedFieldText,
  }) = _ChangeDataEvent;
}

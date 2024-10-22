part of '../../home.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadTexts({
    @Default(true) bool localDownload,
  }) = _LoadTexts;
  const factory HomeEvent.changeText({required TextDTO textDTO}) = _ChangeText;
  const factory HomeEvent.addText({required TextDTO textDTO}) = _AddText;
  const factory HomeEvent.showQRCode({required TextEntity textEntity}) =
      _ShowQRCode;
  const factory HomeEvent.closeQRCode() = _CloseQRCode;
}

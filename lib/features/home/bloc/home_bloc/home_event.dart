part of '../../home.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadTexts({
    @Default(true) bool localDownload,
  }) = _LoadTexts;
  const factory HomeEvent.changeText(
      {required UnencryptedTextDTO unencryptedTextDTO}) = _ChangeText;
  const factory HomeEvent.addText(
      {required UnencryptedTextDTO unencryptedTextDTO}) = _AddText;
  const factory HomeEvent.showQRCode(
      {required UnencryptedTextEntity unencryptedTextEntity}) = _ShowQRCode;
  const factory HomeEvent.closeQRCode() = _CloseQRCode;
}

part of '../../home.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({
    required List<TextEntity> texts,
    @Default(false) bool qrCodeDisplayed,
    TextDTO? qrCodeInfo,
  }) = _Loaded;
}

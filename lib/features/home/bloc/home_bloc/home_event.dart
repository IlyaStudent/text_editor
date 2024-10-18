part of '../../home.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.loadTexts({
    @Default(true) bool localDownload,
  }) = _LoadTexts;
}

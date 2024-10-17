part of '../../on_boarding.dart';

@freezed
class OnBoardingState with _$OnBoardingState {
  const factory OnBoardingState.loading() = _Loading;
  const factory OnBoardingState.loaded({required bool autentithicated}) =
      _Loaded;
}

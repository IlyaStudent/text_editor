part of '../../on_boarding.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(const OnBoardingState.loading());

  Future<void> loadAutentithicationInfo() async {
    Session? session = supabase.auth.currentSession;
    emit(
      OnBoardingState.loaded(autentithicated: session != null),
    );
  }
}

extension OnBoardingCubitBuildContext on BuildContext {
  OnBoardingCubit get onBoardingCubit => read();
}

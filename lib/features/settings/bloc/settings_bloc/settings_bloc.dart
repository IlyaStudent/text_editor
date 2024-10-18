part of '../../settings.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final TextsRepository textsRepository;
  SettingsBloc({required this.textsRepository})
      : super(
          const _Initial(),
        ) {
    on<_SignOutEvent>(_onSignOutEvent);
  }
  Future<void> _onSignOutEvent(
    _SignOutEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      const SettingsState.loading(),
    );
    await supabase.auth.signOut();
    await textsRepository.deleteAllTexts();
    emit(
      const SettingsState.signedOut(),
    );
  }
}

extension SettingBlocBuildContext on BuildContext {
  SettingsBloc get settingsBloc => read();
}

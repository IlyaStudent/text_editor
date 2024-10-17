part of '../../settings.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const _Initial()) {
    on<_SignOutEvent>(_onSignOutEvent);
  }
  Future<void> _onSignOutEvent(
    _SignOutEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      const SettingsState.loading(),
    );
    supabase.auth.signOut();
    emit(
      const SettingsState.signedOut(),
    );
  }
}

extension SettingBlocBuildContext on BuildContext {
  SettingsBloc get settingsBloc => read();
}

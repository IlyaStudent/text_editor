part of '../../settings.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final TextsRepository textsRepository;
  final SettingsRepository settingsRepository;
  SettingsBloc({
    required this.textsRepository,
    required this.settingsRepository,
  }) : super(
          const _Loading(),
        ) {
    on<_SignOutEvent>(_onSignOutEvent);
    on<_DeleteAllDataEvent>(_onDeleteAllDataEvent);
    on<_ChangeModeEvent>(_onChangeModeEvent);
    on<_LoadSettingsDataEvent>(_onLoadSettingsDataEvent);
  }

  Future<void> _onLoadSettingsDataEvent(
    _LoadSettingsDataEvent event,
    Emitter<SettingsState> emit,
  ) async {
    await _emitSettingsData(emit);
  }

  Future<void> _onSignOutEvent(
    _SignOutEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      const SettingsState.loading(),
    );
    await supabase.auth.signOut();
    await textsRepository.deleteAllLocalTexts();

    emit(
      const SettingsState.actionCompleted(signedOut: true),
    );
  }

  Future<void> _onDeleteAllDataEvent(
    _DeleteAllDataEvent event,
    Emitter<SettingsState> emit,
  ) async {
    textsRepository.deleteAllLocalTexts();
    final bool onlineMode =
        await settingsRepository.getBoolValue(key: StringConsts.onlineMode);
    if (onlineMode) {
      await textsRepository.deleteAllRemoteTexts();
    }
    emit(
      const SettingsState.actionCompleted(signedOut: false),
    );
  }

  Future<void> _onChangeModeEvent(
    _ChangeModeEvent event,
    Emitter<SettingsState> emit,
  ) async {
    settingsRepository.changeBoolValue(
      key: event.changedValue,
      value: event.value,
    );
    await _emitSettingsData(emit);
  }

  Future<void> _emitSettingsData(
    Emitter<SettingsState> emit,
  ) async {
    final bool onlineMode =
        await settingsRepository.getBoolValue(key: StringConsts.onlineMode);
    final bool encryptionMode =
        await settingsRepository.getBoolValue(key: StringConsts.encryptionMode);

    emit(
      _Initial(
        onlineMode: onlineMode,
        encryptionMode: encryptionMode,
      ),
    );
  }
}

extension SettingBlocBuildContext on BuildContext {
  SettingsBloc get settingsBloc => read();
}

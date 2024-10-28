part of '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextsRepository textsRepository;
  final SettingsRepository settingsRepository;
  final Encryptor encryptor;
  HomeBloc({
    required this.textsRepository,
    required this.settingsRepository,
    required this.encryptor,
  }) : super(const _Loading()) {
    on<_LoadTexts>(_onLoadTexts);
    on<_ChangeText>(_onChangeText);
    on<_AddText>(_onAddText);
    on<_ShowQRCode>(_onShowQRCode);
    on<_CloseQRCode>(_onCloseQRCode);
  }

  Future<void> _onCloseQRCode(
    _CloseQRCode event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;
    emit(
      HomeState.loaded(
        texts: currentState.texts,
      ),
    );
  }

  Future<void> _onLoadTexts(
    _LoadTexts event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      const HomeState.loading(),
    );
    final bool onlineMode =
        await settingsRepository.getBoolValue(key: StringConsts.onlineMode);
    List<UnencryptedTextEntity> texts = (!event.localDownload && onlineMode)
        ? await textsRepository.getAllRemoteTexts()
        : await textsRepository.getAllLocalTexts();
    emit(
      HomeState.loaded(
        texts: texts,
      ),
    );
  }

  Future<void> _onChangeText(
    _ChangeText event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      const HomeState.loading(),
    );
    await textsRepository.updateText(
        unencryptedTextDTO: event.unencryptedTextDTO);
    List<UnencryptedTextEntity> texts =
        await textsRepository.getAllLocalTexts();
    emit(
      HomeState.loaded(
        texts: texts,
      ),
    );
  }

  Future<void> _onAddText(
    _AddText event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      const HomeState.loading(),
    );
    final bool onlineMode =
        await settingsRepository.getBoolValue(key: StringConsts.onlineMode);
    onlineMode
        ? await textsRepository.createLocalAndRemoteText(
            unencryptedTextDTO: event.unencryptedTextDTO)
        : await textsRepository.createLocalText(
            unencryptedTextDTO: event.unencryptedTextDTO.copyWith(
              id: uuid.v4(),
            ),
          );
    List<UnencryptedTextEntity> texts =
        await textsRepository.getAllLocalTexts();
    emit(
      HomeState.loaded(
        texts: texts,
      ),
    );
  }

  Future<void> _onShowQRCode(
    _ShowQRCode event,
    Emitter<HomeState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;
    final UnencryptedTextDTO unencryptedTextDTO = UnencryptedTextDTO(
      id: event.unencryptedTextEntity.id,
      createdAt: event.unencryptedTextEntity.createdAt,
      userId: event.unencryptedTextEntity.userId,
      textTitle: event.unencryptedTextEntity.textTitle,
      text: event.unencryptedTextEntity.text,
    );
    String qrCodeInfo = jsonEncode(
        await settingsRepository.getBoolValue(key: StringConsts.encryptionMode)
            ? await encryptor.encryptText(unencryptedTextDTO)
            : unencryptedTextDTO);
    if (await settingsRepository.getBoolValue(
        key: StringConsts.encryptionMode)) {
      qrCodeInfo = qrCodeInfo;
    }
    emit(
      HomeState.loaded(
        texts: currentState.texts,
        qrCodeDisplayed: true,
        qrCodeInfo: qrCodeInfo,
      ),
    );
  }
}

extension HomeBlocBuildContext on BuildContext {
  HomeBloc get homeBloc => read();
}

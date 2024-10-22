part of '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextsRepository textsRepository;
  final SettingsRepository settingsRepository;
  HomeBloc({
    required this.textsRepository,
    required this.settingsRepository,
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
    List<TextEntity> texts = (!event.localDownload && onlineMode)
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
    await textsRepository.updateText(textDTO: event.textDTO);
    List<TextEntity> texts = await textsRepository.getAllLocalTexts();
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
        ? await textsRepository.createLocalAndRemoteText(textDTO: event.textDTO)
        : await textsRepository.createLocalText(textEntity: event.textDTO);
    List<TextEntity> texts = await textsRepository.getAllLocalTexts();
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
    final qrCodeInfo = TextDTO(
      id: event.textEntity.id,
      createdAt: event.textEntity.createdAt,
      userId: event.textEntity.userId,
      textTitle: event.textEntity.textTitle,
      text: event.textEntity.text,
    );
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

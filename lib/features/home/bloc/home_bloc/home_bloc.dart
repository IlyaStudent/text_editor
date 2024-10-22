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
    await textsRepository.createText(textDTO: event.textDTO);
    List<TextEntity> texts = await textsRepository.getAllLocalTexts();
    emit(
      HomeState.loaded(
        texts: texts,
      ),
    );
  }
}

extension HomeBlocBuildContext on BuildContext {
  HomeBloc get homeBloc => read();
}

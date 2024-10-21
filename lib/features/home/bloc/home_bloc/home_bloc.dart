part of '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextsRepository textsRepository;
  HomeBloc({required this.textsRepository}) : super(const _Loading()) {
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
    List<TextEntity> texts = event.localDownload
        ? await textsRepository.getAllLocalTexts()
        : await textsRepository.getAllRemoteTexts();
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
    await textsRepository.updateText(textDTO: event.textDTO);
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

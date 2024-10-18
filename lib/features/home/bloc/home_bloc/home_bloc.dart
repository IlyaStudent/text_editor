part of '../../home.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TextsRepository textsRepository;
  HomeBloc({required this.textsRepository}) : super(const _Loading()) {
    on<_LoadTexts>(_onLoadTexts);
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
}

extension HomeBlocBuildContext on BuildContext {
  HomeBloc get homeBloc => read();
}

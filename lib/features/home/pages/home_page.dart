part of '../home.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        textsRepository: instance(),
        settingsRepository: instance(),
      )..add(
          const HomeEvent.loadTexts(),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    bool isLoading = false;
    List<TextEntity> texts = [];

    state.when(
      loading: () => isLoading = true,
      loaded: (
        List<TextEntity> loadedTexts,
        bool qrCodeDisplayed,
        TextDTO? qrCodeInfo,
      ) {
        texts = loadedTexts;
        if (qrCodeDisplayed && qrCodeInfo != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (context) => TextQRCode(
                  qrCodeInfo: qrCodeInfo,
                  closeAction: () =>
                      context.homeBloc.add(const HomeEvent.closeQRCode()),
                ),
              ).then((value) {
                context.homeBloc.add(const HomeEvent.closeQRCode());
              });
            },
          );
        }
      },
    );

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            floatingActionButton: CustomAnimatedFabButton(
              downloadAction: () => context.homeBloc.add(
                const HomeEvent.loadTexts(localDownload: false),
              ),
              addAction: () => context.router.push(
                const AddTextRoute(),
              ),
            ),
            body: texts.isEmpty
                ? Center(
                    child: Text(
                      context.localization.noTextsYet,
                      style: context.textTheme.bodyLarge,
                    ),
                  )
                : TextsWidget(texts: texts),
          );
  }
}

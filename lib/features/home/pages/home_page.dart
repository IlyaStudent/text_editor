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
        encryptor: instance(),
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
    List<UnencryptedTextEntity> texts = [];

    state.when(
      loading: () => isLoading = true,
      loaded: (
        List<UnencryptedTextEntity> loadedTexts,
        bool qrCodeDisplayed,
        String? qrCodeInfo,
      ) {
        texts = loadedTexts;
        if (qrCodeDisplayed && qrCodeInfo != null) {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (context) => TextQRCode(
                  qrCodeInfo: qrCodeInfo,
                ),
              ).then((value) {
                context.homeBloc.add(
                  const HomeEvent.closeQRCode(),
                );
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
              scanAction: () => context.router.push(
                const QRScannerRoute(),
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

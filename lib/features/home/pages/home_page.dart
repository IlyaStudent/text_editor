part of '../home.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        textsRepository: instance(),
      )..add(
          const HomeEvent.loadTexts(),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    return state.map(
      loading: (_Loading state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
      loaded: (_Loaded state) {
        return Scaffold(
          floatingActionButton: CustomAnimatedFabButton(
            downloadAction: () => context.homeBloc.add(
              const HomeEvent.loadTexts(localDownload: false),
            ),
            addAction: () {},
          ),
          body: state.texts.isEmpty
              ? Center(
                  child: Text(
                    context.localization.noTextsYet,
                    style: context.textTheme.bodyLarge,
                  ),
                )
              : TextsWidget(texts: state.texts),
        );
      },
    );
  }
}

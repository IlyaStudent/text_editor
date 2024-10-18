part of '../settings.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        textsRepository: instance(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsBloc>().state;
    bool loading = false;
    state.when(
      initial: () {},
      loading: () => loading = true,
      signedOut: () => context.router.replaceAll(
        [const OnBoradingRoute()],
      ),
    );

    return Scaffold(
      body: Center(
        child: loading
            ? const CircularProgressIndicator()
            : CustomFilledButton(
                text: context.localization.signOut,
                onPressed: () => context.settingsBloc.add(
                  const SettingsEvent.signOut(),
                ),
              ),
      ),
    );
  }
}

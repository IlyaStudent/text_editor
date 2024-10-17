part of '../on_boarding.dart';

@RoutePage()
class OnBoradingPage extends StatelessWidget implements AutoRouteWrapper {
  const OnBoradingPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit()..loadAutentithicationInfo(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OnBoardingCubit>().state;
    bool loading = true;

    state.when(
      loading: () {
        loading = true;
      },
      loaded: (bool isRegistered) {
        if (isRegistered) context.router.replaceAll([const NavBarRoute()]);
        loading = false;
      },
    );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: loading
              ? const CircularProgressIndicator()
              : const OnBoardingForm(),
        ),
      ),
    );
  }
}

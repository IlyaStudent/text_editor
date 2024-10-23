part of '../on_boarding.dart';

@RoutePage()
class OnBoradingPage extends StatefulWidget implements AutoRouteWrapper {
  const OnBoradingPage({super.key});

  @override
  State<OnBoradingPage> createState() => _OnBoradingPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit()..loadAutentithicationInfo(),
      child: this,
    );
  }
}

class _OnBoradingPageState extends State<OnBoradingPage> {
  final LocalAuthentication _auth = LocalAuthentication();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<OnBoardingCubit>().state;
    bool loading = true;

    state.when(
      loading: () {
        loading = true;
      },
      loaded: (bool isRegistered) async {
        if (isRegistered) {
          final bool autentithicated = await _auth.authenticate(
            localizedReason: context.localization.autentithicateToSeeYourNotes,
            options: const AuthenticationOptions(),
          );
          if (autentithicated) context.router.replaceAll([const NavBarRoute()]);
        }
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

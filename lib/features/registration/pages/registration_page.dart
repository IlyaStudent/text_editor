part of '../registration.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget implements AutoRouteWrapper {
  const RegistrationPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<RegistrationBloc>().state;
    bool isLoading = false;
    RegistrationErrorEntity registrationErrorEntity =
        const RegistrationErrorEntity();

    state.when(
      checkingData: (
        RegistrationErrorDTO registrationErrorDTO,
        RegistrationDTO registrationDTO,
      ) {
        registrationErrorEntity = registrationErrorDTO;
      },
      loading: () {
        isLoading = true;
      },
      registered: () => context.router.replaceAll(
        [const HomeRoute()],
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: RegistrationFormWidget(
          registrationErrorEntity: registrationErrorEntity,
          isDisabled: !registrationErrorEntity.isValid,
          isLoading: isLoading,
        ),
      ),
    );
  }
}

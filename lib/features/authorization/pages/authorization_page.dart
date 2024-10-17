part of '../authorization.dart';

@RoutePage()
class AuthorizationPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthorizationPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(
        autentithicationRepository: instance(),
      ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AuthorizationBloc>().state;
    bool isLoading = false;
    AuthorizationErrorEntity authorizationErrorEntity =
        const AuthorizationErrorEntity();

    state.when(checkingData: (AuthorizationDTO authorizationDTO,
        AuthorizationErrorDTO authorizationErrorDTO) {
      authorizationErrorEntity = authorizationErrorDTO;
    }, loading: () {
      isLoading = true;
    }, authorized: () {
      context.router.replaceAll([
        const NavBarRoute(),
      ]);
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AuthorizationFormWidget(
          authorizationErrorEntity: authorizationErrorEntity,
          isDisabled: !authorizationErrorEntity.isValid,
          isLoading: isLoading,
        ),
      ),
    );
  }
}

part of '../authorization.dart';

@RoutePage()
class AuthorizationPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthorizationPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthorizationBloc(),
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
        const HomeRoute(),
      ]);
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.localization.signIn,
              style: context.textTheme.displaySmall?.copyWith(
                color: context.colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            AuthorizationFormWidget(
                authorizationErrorEntity: authorizationErrorEntity,
                isDisabled: !authorizationErrorEntity.isValid,
                isLoading: isLoading)
          ],
        ),
      ),
    );
  }
}

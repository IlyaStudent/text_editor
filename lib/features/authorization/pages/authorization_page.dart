part of '../authorization.dart';

@RoutePage()
class AuthorizationPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthorizationPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: EdgeInsets.only(
                top: context.deviceHeight * 0.1,
                bottom: 16,
              ),
              child: CustomTextField(
                labelText: context.localization.email,
                prefixIcon: Icons.email,
                hintText: context.localization.enterYoutEmail,
              ),
            ),
            CustomTextField(
              labelText: context.localization.password,
              prefixIcon: Icons.lock,
              hideable: true,
              hintText: context.localization.enterYourPassword,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {},
                  child: Text(
                    context.localization.signIn,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () => context.router.replace(
                const RegistrationRoute(),
              ),
              child: Text(context.localization.signUp),
            )
          ],
        ),
      ),
    );
  }
}

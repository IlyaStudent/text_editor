part of '../registration.dart';

@RoutePage()
class RegistrationPage extends StatelessWidget implements AutoRouteWrapper {
  const RegistrationPage({super.key});

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
              ),
              child: CustomTextField(
                labelText: context.localization.email,
                prefixIcon: Icons.email,
                hintText: context.localization.enterYoutEmail,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: CustomTextField(
                labelText: context.localization.password,
                prefixIcon: Icons.lock,
                hideable: true,
                hintText: context.localization.enterYourPassword,
                obscureText: true,
              ),
            ),
            CustomTextField(
              labelText: context.localization.confirmPassword,
              prefixIcon: Icons.lock,
              hideable: true,
              hintText: context.localization.confirmYourPassword,
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
                const AuthorizationRoute(),
              ),
              child: Text(
                context.localization.signIn,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return this;
  }
}

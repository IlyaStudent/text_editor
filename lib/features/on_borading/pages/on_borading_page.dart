part of '../on_borading.dart';

@RoutePage()
class OnBoradingPage extends StatelessWidget {
  const OnBoradingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: context.deviceHeight * 0.25,
              ),
              Icon(
                Icons.edit_rounded,
                color: context.colorScheme.primary,
                size: 120,
              ),
              Text(
                StringConsts.appName,
                style: context.textTheme.displayMedium?.copyWith(
                  color: context.colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 64,
                ),
                child: Text(
                  context.localization.writeAndStoreYourNotesWithUs,
                  style: context.textTheme.bodyLarge,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => context.router.push(
                    const AuthorizationRoute(),
                  ),
                  child: Text(
                    context.localization.iAlreadyHaveAnAccount,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => context.router.push(
                      const RegistrationRoute(),
                    ),
                    child: Text(
                      context.localization.createAnAccount,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(
                      text: context.localization.bySingingUpYouAgreeToOur,
                      style: context.textTheme.bodySmall,
                      children: [
                        TextSpan(
                            text: context.localization.termsAndConditions,
                            style: context.textTheme.bodySmall?.copyWith(
                                decoration: TextDecoration.underline))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

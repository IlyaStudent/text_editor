part of '../authorization.dart';

class AuthorizationFormWidget extends StatelessWidget {
  final AuthorizationErrorEntity authorizationErrorEntity;
  final bool isDisabled;
  final bool isLoading;
  const AuthorizationFormWidget({
    super.key,
    required this.authorizationErrorEntity,
    required this.isDisabled,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            authorizationErrorEntity.signInError
                ? context.localization.invalidData
                : StringConsts.emptyString,
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.error,
            ),
          ),
        ),
        CustomTextField(
          onChanged: (changedFieldText) => context.authorizationBloc.add(
            AuthorizationEvent.changeData(
                changedFieldName: StringConsts.email,
                changedFieldText: changedFieldText),
          ),
          labelText: context.localization.email,
          errorText: authorizationErrorEntity.email
              ? null
              : context.localization.passwordMustBe625Symbols,
          prefixIcon: Icons.email,
          hintText: context.localization.enterYoutEmail,
        ),
        CustomTextField(
          onChanged: (changedFieldText) => context.authorizationBloc.add(
            AuthorizationEvent.changeData(
                changedFieldName: StringConsts.password,
                changedFieldText: changedFieldText),
          ),
          errorText: authorizationErrorEntity.password
              ? null
              : context.localization.passwordMustBe625Symbols,
          labelText: context.localization.password,
          prefixIcon: Icons.lock,
          hideable: true,
          hintText: context.localization.enterYourPassword,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: double.infinity,
            child: CustomFilledButton(
              onPressed: () => context.authorizationBloc.add(
                const AuthorizationEvent.authorize(),
              ),
              isDisabled: isDisabled,
              isLoading: isLoading,
              text: context.localization.signIn,
            ),
          ),
        ),
        CustomTextButton(
          isDisabled: isDisabled,
          isLoading: isLoading,
          text: context.localization.signUp,
          onPressed: () => context.router.replace(
            const RegistrationRoute(),
          ),
        ),
      ],
    );
  }
}

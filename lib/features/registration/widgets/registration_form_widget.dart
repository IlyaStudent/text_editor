part of '../registration.dart';

class RegistrationFormWidget extends StatelessWidget {
  final RegistrationErrorEntity registrationErrorEntity;
  final bool isDisabled;
  final bool isLoading;
  const RegistrationFormWidget({
    super.key,
    required this.registrationErrorEntity,
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
        Padding(
          padding: EdgeInsets.only(
            top: context.deviceHeight * 0.1,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              registrationErrorEntity.userAlreadyRegisteredError
                  ? context.localization.invalidDataOrEmailIsAlreadyTaken
                  : StringConsts.emptyString,
              style: context.textTheme.labelMedium?.copyWith(
                color: context.colorScheme.error,
              ),
            ),
          ),
        ),
        CustomTextField(
          labelText: context.localization.email,
          errorText: registrationErrorEntity.email
              ? null
              : context.localization.incorrectEmail,
          onChanged: (changedFieldText) => context.registrationBloc.add(
            RegistrationEvent.changeData(
              changedFieldName: StringConsts.email,
              changedFieldText: changedFieldText,
            ),
          ),
          prefixIcon: Icons.email,
          hintText: context.localization.enterYoutEmail,
        ),
        CustomTextField(
          labelText: context.localization.password,
          errorText: registrationErrorEntity.plainPassword
              ? null
              : context.localization.passwordMustBe625Symbols,
          onChanged: (changedFieldText) => context.registrationBloc.add(
            RegistrationEvent.changeData(
              changedFieldName: StringConsts.plainPassword,
              changedFieldText: changedFieldText,
            ),
          ),
          prefixIcon: Icons.lock,
          hideable: true,
          hintText: context.localization.enterYourPassword,
          obscureText: true,
        ),
        CustomTextField(
          labelText: context.localization.confirmPassword,
          errorText: registrationErrorEntity.confirmPassword
              ? null
              : context.localization.passwordsMustBeTheSame,
          onChanged: (changedFieldText) => context.registrationBloc.add(
            RegistrationEvent.changeData(
              changedFieldName: StringConsts.confirmPassword,
              changedFieldText: changedFieldText,
            ),
          ),
          prefixIcon: Icons.lock,
          hideable: true,
          hintText: context.localization.confirmYourPassword,
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: SizedBox(
            width: double.infinity,
            child: CustomFilledButton(
              text: context.localization.signUp,
              isDisabled: isDisabled,
              isLoading: isLoading,
              onPressed: () => context.registrationBloc.add(
                const RegistrationEvent.register(),
              ),
            ),
          ),
        ),
        CustomTextButton(
            text: context.localization.signIn,
            isDisabled: isDisabled,
            isLoading: isLoading,
            onPressed: () => context.router.replace(
                  const AuthorizationRoute(),
                ))
      ],
    );
  }
}

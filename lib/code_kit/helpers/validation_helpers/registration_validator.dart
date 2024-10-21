part of '../../code_kit.dart';

class RegistrationValidator implements Validator {
  final String changedFieldName;
  final String changedFieldText;

  RegistrationDTO registrationDTO;
  RegistrationErrorDTO registrationErrorDTO;

  RegistrationValidator({
    required this.changedFieldName,
    required this.changedFieldText,
    required this.registrationDTO,
    required this.registrationErrorDTO,
  });

  @override
  void changeData() {
    final Map<String, dynamic> registrationData = registrationDTO.toJson();
    registrationData[changedFieldName] = changedFieldText;
    registrationDTO = RegistrationDTO.fromJson(registrationData);
  }

  @override
  void validateFields() {
    Map<String, dynamic> registraionErrorData = registrationErrorDTO.toJson();
    if (changedFieldName == StringConsts.email) {
      registraionErrorData[StringConsts.email] =
          ValidateFunctions._checkEmail(changedFieldText);
    } else {
      registraionErrorData[StringConsts.plainPassword] =
          ValidateFunctions._checkPlainPassword(registrationDTO.plainPassword);
      registraionErrorData[StringConsts.confirmPassword] =
          ValidateFunctions._checkConfirmPassword(
        registrationDTO.plainPassword,
        registrationDTO.confirmPassword,
      );
    }
    registraionErrorData[StringConsts.isValid] =
        (registraionErrorData[StringConsts.plainPassword] ?? false) &&
            (registraionErrorData[StringConsts.confirmPassword] ?? false) &&
            (registraionErrorData[StringConsts.email] ?? false);
    registrationErrorDTO = RegistrationErrorDTO.fromJson(registraionErrorData);
  }
}

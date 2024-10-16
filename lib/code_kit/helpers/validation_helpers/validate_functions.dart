part of '../../code_kit.dart';

class ValidateFunctions {
  static bool _checkEmail(String? email) {
    return email != null
        ? RegExp(StringConsts.regEmailValidate).hasMatch(email)
        : false;
  }

  static bool _checkPlainPassword(String? plainPassword) {
    return plainPassword != null
        ? plainPassword.length > 5 && plainPassword.length < 25
        : false;
  }

  static bool _checkConfirmPassword(
      String? plainPassword, String? confirmPassword) {
    return plainPassword == confirmPassword;
  }
}

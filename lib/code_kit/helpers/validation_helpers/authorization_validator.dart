part of '../../code_kit.dart';

class AuthorizationValidator implements Validator {
  final String changedFieldName;
  final String changedFieldText;

  AuthorizationDTO authorizationDTO;
  AuthorizationErrorDTO authorizationErrorDTO;

  AuthorizationValidator({
    required this.changedFieldName,
    required this.changedFieldText,
    required this.authorizationDTO,
    required this.authorizationErrorDTO,
  });

  @override
  void changeData() {
    final Map<String, dynamic> authorizationData = authorizationDTO.toJson();
    authorizationData[changedFieldName] = changedFieldText;
    authorizationDTO = AuthorizationDTO.fromJson(authorizationData);
  }

  @override
  void validateFields() {
    Map<String, dynamic> authorizationErrorData =
        authorizationErrorDTO.toJson();
    authorizationErrorData[changedFieldName] =
        (changedFieldName == StringConsts.email)
            ? ValidateFunctions._checkEmail(changedFieldText)
            : ValidateFunctions._checkPlainPassword(changedFieldText);
    authorizationErrorData[StringConsts.isValid] =
        authorizationErrorData[StringConsts.email] &&
            authorizationErrorData[StringConsts.password];
    authorizationErrorDTO =
        AuthorizationErrorDTO.fromJson(authorizationErrorData);
  }
}

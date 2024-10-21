part of '../registration.dart';

class RegistrationErrorEntity {
  final bool isValid;
  final bool userAlreadyRegisteredError;
  final bool invalidDataError;
  final bool? email;
  final bool? plainPassword;
  final bool? confirmPassword;

  const RegistrationErrorEntity({
    this.isValid = false,
    this.userAlreadyRegisteredError = false,
    this.invalidDataError = false,
    this.email,
    this.plainPassword,
    this.confirmPassword,
  });
}

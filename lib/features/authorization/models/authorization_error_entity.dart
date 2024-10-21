part of '../authorization.dart';

class AuthorizationErrorEntity {
  final bool isValid;
  final bool? email;
  final bool? password;
  final bool signInError;

  const AuthorizationErrorEntity({
    this.isValid = false,
    this.email = true,
    this.password = true,
    this.signInError = false,
  });
}

part of '../registration.dart';

class RegistrationEntity {
  final String? email;
  final String? plainPassword;
  final String? confirmPassword;

  const RegistrationEntity({
    required this.email,
    required this.plainPassword,
    required this.confirmPassword,
  });
}

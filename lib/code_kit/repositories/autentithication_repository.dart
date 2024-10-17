part of '../code_kit.dart';

abstract class AutentithicationRepository {
  Future<void> signIn({required AuthorizationEnity authorizationEntity});

  Future<void> signUp({required RegistrationEntity registrationEntity});
}

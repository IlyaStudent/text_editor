part of '../code_kit.dart';

class AutentithicationRepositoryImpl implements AutentithicationRepository {
  @override
  Future<void> signIn({required AuthorizationEnity authorizationEntity}) =>
      supabase.auth.signInWithPassword(
        password: authorizationEntity.password ?? StringConsts.emptyString,
        email: authorizationEntity.email ?? StringConsts.emptyString,
      );

  @override
  Future<void> signUp({required RegistrationEntity registrationEntity}) =>
      supabase.auth.signUp(
        password: registrationEntity.plainPassword ?? StringConsts.emptyString,
        email: registrationEntity.email ?? StringConsts.emptyString,
      );
}

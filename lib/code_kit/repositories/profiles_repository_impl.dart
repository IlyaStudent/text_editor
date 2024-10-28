part of './../code_kit.dart';

class ProfilesRepositoryImpl implements ProfilesRepository {
  final ProfilesRemoteDataSource profilesRemoteDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;

  ProfilesRepositoryImpl({
    required this.profilesRemoteDataSource,
    required this.settingsLocalDataSource,
  });

  @override
  Future<String> getSalt() async =>
      await settingsLocalDataSource.getStringValue(key: StringConsts.salt) ??
      StringConsts.emptyString;

  @override
  Future<void> writeSaltAndPassword({required String password}) async {
    final salt =
        await profilesRemoteDataSource.getSalt(supabase.auth.currentUser!.id);

    settingsLocalDataSource
      ..changeStringValue(
        key: StringConsts.salt,
        value: salt,
      )
      ..changeStringValue(
        key: StringConsts.password,
        value: password,
      );
  }

  @override
  Future<String> getPassword() async =>
      await settingsLocalDataSource.getStringValue(
          key: StringConsts.password) ??
      StringConsts.emptyString;
}

part of '../code_kit.dart';

final instance = GetIt.instance;
final supabase = Supabase.instance.client;
const uuid = Uuid();

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance

    // data providers
    ..registerLazySingleton<ProfilesRemoteDataSource>(
      () => ProfilesRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<TextsRemoteDataSource>(
      () => TextsRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<TextsLocalDataSource>(
      () => TextsLocalDataSouceImpl(),
    )
    ..registerLazySingleton<SettingsLocalDataSource>(
      () => SettingsLocalDataSourceImpl(
        sharedPreferences: instance(),
      ),
    )

    // repositories
    ..registerLazySingleton<AutentithicationRepository>(
      () => AutentithicationRepositoryImpl(),
    )
    ..registerLazySingleton<TextsRepository>(
      () => TextsRepositoryImpl(
        encryptor: instance(),
        textsRemoteDataSource: instance(),
        textsLocalDataSource: instance(),
        settingsLocalDataSource: instance(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsLocalDataSource: instance(),
      ),
    )
    ..registerLazySingleton<ProfilesRepository>(
      () => ProfilesRepositoryImpl(
        profilesRemoteDataSource: instance(),
        settingsLocalDataSource: instance(),
      ),
    )

    // encryptors
    ..registerLazySingleton<Encryptor>(
      () => AesEncryptor(
        profilesRepository: instance(),
      ),
    )

    // external
    ..registerLazySingleton<SharedPreferences>(
      () => sharedPreferences,
    )
    ..registerLazySingleton(
      () => uuid,
    );
}

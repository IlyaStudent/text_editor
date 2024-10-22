part of '../code_kit.dart';

final instance = GetIt.instance;
final supabase = Supabase.instance.client;

Future<void> init() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  instance

    // data providers
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
        textsRemoteDataSource: instance(),
        textsLocalDataSource: instance(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(
        settingsLocalDataSource: instance(),
      ),
    )

    // external
    ..registerLazySingleton(
      () => sharedPreferences,
    );
}

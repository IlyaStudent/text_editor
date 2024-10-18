part of '../code_kit.dart';

final instance = GetIt.instance;
final supabase = Supabase.instance.client;

Future<void> init() async {
  instance

    // data providers
    ..registerLazySingleton<AutentithicationRepository>(
      () => AutentithicationRepositoryImpl(),
    )
    ..registerLazySingleton<TextsRemoteDataSource>(
      () => TextsRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<TextsLocalDataSource>(
      () => TextsLocalDataSouceImpl(),
    )

    // repositories
    ..registerLazySingleton<TextsRepository>(
      () => TextsRepositoryImpl(
        textsRemoteDataSource: instance(),
        textsLocalDataSource: instance(),
      ),
    );
}

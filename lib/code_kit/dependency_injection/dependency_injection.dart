part of '../code_kit.dart';

final instance = GetIt.instance;
final supabase = Supabase.instance.client;

Future<void> init() async {
  instance

    // repositories
    ..registerLazySingleton<AutentithicationRepository>(
      () => AutentithicationRepositoryImpl(),
    )

    // data providers
    ..registerLazySingleton<TextsRemoteDataSource>(
      () => TextsRemoteDataSourceImpl(),
    )
    ..registerLazySingleton<TextsRepository>(
      () => TextsRepositoryImpl(
        textsRemoteDataSource: instance(),
      ),
    );
}

part of '../code_kit.dart';

final instance = GetIt.instance;
final supabase = Supabase.instance.client;

Future<void> init() async {
  instance.registerLazySingleton<AutentithicationRepository>(
    () => AutentithicationRepositoryImpl(),
  );
}

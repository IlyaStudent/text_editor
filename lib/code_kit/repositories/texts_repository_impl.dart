part of '../code_kit.dart';

class TextsRepositoryImpl implements TextsRepository {
  final TextsRemoteDataSource textsRemoteDataSource;

  TextsRepositoryImpl({required this.textsRemoteDataSource});

  @override
  Future<void> createText({required TextDTO textDTO}) =>
      textsRemoteDataSource.createText(textDTO: textDTO);

  @override
  Future<List<TextEntity>> getAllTexts() => textsRemoteDataSource.getAllTexts(
        userId: supabase.auth.currentUser!.id,
      );

  @override
  Future<void> updateText({required TextDTO textDTO}) =>
      textsRemoteDataSource.updateText(textDTO: textDTO);
}

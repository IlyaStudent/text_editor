part of '../code_kit.dart';

class TextsRepositoryImpl implements TextsRepository {
  final TextsRemoteDataSource textsRemoteDataSource;
  final TextsLocalDataSource textsLocalDataSource;

  TextsRepositoryImpl({
    required this.textsRemoteDataSource,
    required this.textsLocalDataSource,
  });

  @override
  Future<List<TextEntity>> getAllRemoteTexts() async {
    final texts = await textsRemoteDataSource.getAllTexts(
      userId: supabase.auth.currentUser!.id,
    );
    await textsLocalDataSource.deleateAllTexts();
    await textsLocalDataSource.writeAllTexts(texts: texts);
    return await textsLocalDataSource.getAllTexts();
  }

  @override
  Future<List<TextEntity>> getAllLocalTexts() =>
      textsLocalDataSource.getAllTexts();

  @override
  Future<void> createText({required TextDTO textDTO}) =>
      textsRemoteDataSource.createText(textDTO: textDTO);

  @override
  Future<void> updateText({required TextDTO textDTO}) =>
      textsRemoteDataSource.updateText(textDTO: textDTO);
}

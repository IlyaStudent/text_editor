part of '../../code_kit.dart';

abstract class TextsRemoteDataSource {
  Future<List<TextDTO>> getAllTexts({required String userId});

  Future<void> updateText({required TextDTO textDTO});

  Future<TextDTO> createText({required TextDTO textDTO});

  Future<void> deleteTexts({required String userId});
}

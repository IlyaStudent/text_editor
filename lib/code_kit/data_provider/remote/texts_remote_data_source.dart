part of '../../code_kit.dart';

abstract class TextsRemoteDataSource {
  Future<List<UnencryptedTextDTO>> getAllTexts({required String userId});

  Future<void> updateText({required UnencryptedTextDTO unencryptedTextDTO});

  Future<UnencryptedTextDTO> createText(
      {required UnencryptedTextDTO unencryptedTextDTO});

  Future<void> deleteTexts({required String userId});
}

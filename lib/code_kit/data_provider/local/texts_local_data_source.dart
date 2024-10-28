part of '../../code_kit.dart';

abstract class TextsLocalDataSource {
  Future<List<UnencryptedTextDTO>> getAllUnencryptedTexts();

  Future<List<EncryptedTextDTO>> getAllEncryptedTexts();

  Future<void> writeUnencryptedTexts(
      {required List<UnencryptedTextEntity> texts});

  Future<void> writeEncryptedTexts({required List<EncryptedTextEntity> texts});

  Future<void> deleateAllTexts({required bool encryptionMode});

  Future<void> addUnencryptedText(
      {required UnencryptedTextEntity unencryptedTextEntity});

  Future<void> addEncryptedText(
      {required EncryptedTextEntity encryptedTextEntity});

  Future<void> updateEncryptedText(
      {required EncryptedTextEntity encryptedTextEntity});

  Future<void> updateUnencryptedText(
      {required UnencryptedTextEntity unencryptedTextEntity});
}

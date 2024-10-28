part of '../code_kit.dart';

abstract class TextsRepository {
  Future<List<UnencryptedTextEntity>> getAllRemoteTexts();

  Future<List<UnencryptedTextEntity>> getAllLocalTexts();

  Future<void> updateText({required UnencryptedTextDTO unencryptedTextDTO});

  Future<void> createLocalAndRemoteText(
      {required UnencryptedTextDTO unencryptedTextDTO});

  Future<void> createLocalText(
      {required UnencryptedTextDTO unencryptedTextDTO});

  Future<void> deleteAllLocalTexts();

  Future<void> deleteAllRemoteTexts();

  Future<void> transferToEncrypted();

  Future<void> transferToUnencrypted();
}

part of '../code_kit.dart';

abstract class TextsRepository {
  Future<List<TextEntity>> getAllRemoteTexts();

  Future<List<TextEntity>> getAllLocalTexts();

  Future<void> updateText({required TextDTO textDTO});

  Future<void> createText({required TextDTO textDTO});

  Future<void> deleteAllTexts();
}

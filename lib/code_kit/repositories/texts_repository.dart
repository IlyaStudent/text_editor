part of '../code_kit.dart';

abstract class TextsRepository {
  Future<List<TextEntity>> getAllTexts();

  Future<void> updateText({required TextDTO textDTO});

  Future<void> createText({required TextDTO textDTO});
}

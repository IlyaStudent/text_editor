part of '../code_kit.dart';

abstract class TextsRepository {
  Future<List<TextEntity>> getAllRemoteTexts();

  Future<List<TextEntity>> getAllLocalTexts();

  Future<void> updateText({required TextDTO textDTO});

  Future<void> createLocalAndRemoteText({required TextDTO textDTO});

  Future<void> createLocalText({required TextEntity textEntity});

  Future<void> deleteAllLocalTexts();

  Future<void> deleteAllRemoteTexts();
}

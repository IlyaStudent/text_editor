part of '../../code_kit.dart';

abstract class TextsLocalDataSource {
  Future<List<TextEntity>> getAllTexts();

  Future<void> writeAllTexts({required List<TextEntity> texts});

  Future<void> deleateAllTexts();
}

part of '../../code_kit.dart';

class TextsLocalDataSouceImpl implements TextsLocalDataSource {
  final String _boxName = "textBox";
  Future<Box<TextEntity>> get _box async =>
      await Hive.openBox<TextEntity>(_boxName);

  @override
  Future<void> deleateAllTexts() async {
    final box = await _box;
    await box.deleteFromDisk();
  }

  @override
  Future<List<TextEntity>> getAllTexts() async {
    final box = await _box;
    return box.values.toList();
  }

  @override
  Future<void> writeAllTexts({required List<TextEntity> texts}) async {
    final box = await _box;
    texts.forEach(
      (e) => box.add(e),
    );
  }
}

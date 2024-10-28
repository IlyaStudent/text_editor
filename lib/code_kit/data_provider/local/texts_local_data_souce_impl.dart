part of '../../code_kit.dart';

class TextsLocalDataSouceImpl implements TextsLocalDataSource {
  final String _unencrtyptedBoxName = StringConsts.unencryptedTextBox;
  final String _encrtyptedBoxName = StringConsts.encryptedTextBox;
  Future<Box<UnencryptedTextEntity>> get _unencryptedBox async =>
      await Hive.openBox<UnencryptedTextEntity>(_unencrtyptedBoxName);
  Future<Box<EncryptedTextEntity>> get _encryptedBox async =>
      await Hive.openBox<EncryptedTextEntity>(_encrtyptedBoxName);

  @override
  Future<void> deleateAllTexts({required bool encryptionMode}) async {
    if (encryptionMode) {
      final encryptedBox = await _encryptedBox;
      await encryptedBox.clear();
    } else {
      final unencryptedBox = await _unencryptedBox;
      await unencryptedBox.clear();
    }
  }

  @override
  Future<List<UnencryptedTextDTO>> getAllUnencryptedTexts() async {
    final box = await _unencryptedBox;
    return box.values
        .toList()
        .map(
          (e) => UnencryptedTextDTO(
              id: e.id,
              createdAt: e.createdAt,
              userId: e.userId,
              textTitle: e.textTitle,
              text: e.text),
        )
        .toList();
  }

  @override
  Future<List<EncryptedTextDTO>> getAllEncryptedTexts() async {
    final box = await _encryptedBox;
    return box.values
        .toList()
        .map(
          (e) => EncryptedTextDTO(
            id: e.id,
            nonce: e.nonce,
            mac: e.mac,
            cipherText: e.cipherText,
          ),
        )
        .toList();
  }

  @override
  Future<void> writeUnencryptedTexts(
      {required List<UnencryptedTextEntity> texts}) async {
    final box = await _unencryptedBox;
    log("${texts.first.id}");
    await box.putAll(
      texts.asMap().map(
            (key, value) => MapEntry(value.id, value),
          ),
    );
  }

  @override
  Future<void> writeEncryptedTexts(
      {required List<EncryptedTextEntity> texts}) async {
    final box = await _encryptedBox;
    await box.putAll(
      texts.asMap().map(
            (key, value) => MapEntry(value.id, value),
          ),
    );
  }

  @override
  Future<void> addUnencryptedText(
      {required UnencryptedTextEntity unencryptedTextEntity}) async {
    final box = await _unencryptedBox;
    await box.add(unencryptedTextEntity);
  }

  @override
  Future<void> updateUnencryptedText(
      {required UnencryptedTextEntity unencryptedTextEntity}) async {
    final box = await _unencryptedBox;
    box.put(unencryptedTextEntity.id, unencryptedTextEntity);
  }

  @override
  Future<void> addEncryptedText(
      {required EncryptedTextEntity encryptedTextEntity}) async {
    final box = await _encryptedBox;
    await box.add(encryptedTextEntity);
  }

  @override
  Future<void> updateEncryptedText(
      {required EncryptedTextEntity encryptedTextEntity}) async {
    final box = await _encryptedBox;
    box.put(encryptedTextEntity.id, encryptedTextEntity);
  }
}

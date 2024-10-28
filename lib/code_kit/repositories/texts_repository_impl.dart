part of '../code_kit.dart';

class TextsRepositoryImpl implements TextsRepository {
  final TextsRemoteDataSource textsRemoteDataSource;
  final TextsLocalDataSource textsLocalDataSource;
  final SettingsLocalDataSource settingsLocalDataSource;
  final Encryptor encryptor;

  TextsRepositoryImpl({
    required this.encryptor,
    required this.textsRemoteDataSource,
    required this.textsLocalDataSource,
    required this.settingsLocalDataSource,
  });

  Future<bool> get _encryptionMode async =>
      await settingsLocalDataSource.getBoolValue(
          key: StringConsts.encryptionMode) ??
      false;

  @override
  Future<List<UnencryptedTextEntity>> getAllRemoteTexts() async {
    final List<UnencryptedTextDTO> texts =
        await textsRemoteDataSource.getAllTexts(
      userId: supabase.auth.currentUser!.id,
    );
    await textsLocalDataSource.deleateAllTexts(
      encryptionMode: await _encryptionMode,
    );

    await _encryptionMode
        ? await textsLocalDataSource.writeEncryptedTexts(
            texts: await encryptor.encryptTextList(texts),
          )
        : await textsLocalDataSource.writeUnencryptedTexts(texts: texts);
    final result = texts;
    return result;
  }

  @override
  Future<List<UnencryptedTextEntity>> getAllLocalTexts() async =>
      await _encryptionMode
          ? await encryptor.decryptTextList(
              await textsLocalDataSource.getAllEncryptedTexts(),
            )
          : await textsLocalDataSource.getAllUnencryptedTexts();

  @override
  Future<void> createLocalAndRemoteText(
      {required UnencryptedTextDTO unencryptedTextDTO}) async {
    final UnencryptedTextEntity unencryptedTextEntity =
        await textsRemoteDataSource.createText(
            unencryptedTextDTO: unencryptedTextDTO);
    await _encryptionMode
        ? textsLocalDataSource.addEncryptedText(
            encryptedTextEntity:
                await encryptor.encryptText(unencryptedTextDTO),
          )
        : textsLocalDataSource.addUnencryptedText(
            unencryptedTextEntity: unencryptedTextEntity);
  }

  @override
  Future<void> updateText(
      {required UnencryptedTextDTO unencryptedTextDTO}) async {
    await textsRemoteDataSource.updateText(
        unencryptedTextDTO: unencryptedTextDTO);
    await _encryptionMode
        ? await textsLocalDataSource.updateEncryptedText(
            encryptedTextEntity:
                await encryptor.encryptText(unencryptedTextDTO),
          )
        : await textsLocalDataSource.updateUnencryptedText(
            unencryptedTextEntity: unencryptedTextDTO);
  }

  @override
  Future<void> deleteAllLocalTexts() async =>
      textsLocalDataSource.deleateAllTexts(
        encryptionMode: await _encryptionMode,
      );

  @override
  Future<void> deleteAllRemoteTexts() => textsRemoteDataSource.deleteTexts(
        userId: supabase.auth.currentUser!.id,
      );

  @override
  Future<void> createLocalText(
          {required UnencryptedTextDTO unencryptedTextDTO}) async =>
      await _encryptionMode
          ? await textsLocalDataSource.addEncryptedText(
              encryptedTextEntity:
                  await encryptor.encryptText(unencryptedTextDTO),
            )
          : await textsLocalDataSource.addUnencryptedText(
              unencryptedTextEntity: unencryptedTextDTO);

  @override
  Future<void> transferToEncrypted() async {
    List<UnencryptedTextEntity> texts =
        await textsLocalDataSource.getAllUnencryptedTexts();
    List<UnencryptedTextDTO> textsDTO = texts
        .map(
          (UnencryptedTextEntity e) => UnencryptedTextDTO(
            id: e.id,
            createdAt: e.createdAt,
            userId: e.userId,
            textTitle: e.textTitle,
            text: e.text,
          ),
        )
        .toList();
    textsLocalDataSource.deleateAllTexts(
      encryptionMode: !(await _encryptionMode),
    );
    log(textsDTO.length.toString());
    textsLocalDataSource.writeEncryptedTexts(
      texts: await encryptor.encryptTextList(textsDTO),
    );
  }

  @override
  Future<void> transferToUnencrypted() async {
    final encryptedTexts = await textsLocalDataSource.getAllEncryptedTexts();
    final texts = await encryptor.decryptTextList(encryptedTexts);
    textsLocalDataSource.deleateAllTexts(
      encryptionMode: !(await _encryptionMode),
    );
    log(texts.length.toString());
    textsLocalDataSource.writeUnencryptedTexts(texts: texts);
  }
}

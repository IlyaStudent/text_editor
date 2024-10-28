part of '../../code_kit.dart';

abstract class Encryptor {
  Future<SecretKey> generateKey();

  Future<EncryptedTextDTO> encryptText(
    UnencryptedTextDTO unencryptedTextDTO,
  );

  Future<UnencryptedTextEntity> decryptText(
    EncryptedTextEntity encryptedTextEntity,
  );

  Future<List<EncryptedTextDTO>> encryptTextList(
    List<UnencryptedTextDTO> texts,
  );

  Future<List<UnencryptedTextEntity>> decryptTextList(
    List<EncryptedTextEntity> texts,
  );
}

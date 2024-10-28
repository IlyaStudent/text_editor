part of '../../code_kit.dart';

class AesEncryptor implements Encryptor {
  final int keyLength = 32;
  final int iterations = 1000;
  final ProfilesRepository profilesRepository;

  AesEncryptor({required this.profilesRepository});

  @override
  Future<SecretKey> generateKey() async {
    final String password = await profilesRepository.getPassword();
    final String salt = await profilesRepository.getSalt();
    final Pbkdf2 pbkdf2 = Pbkdf2(
      macAlgorithm: Hmac.sha256(),
      iterations: iterations,
      bits: keyLength * 8,
    );
    final key = pbkdf2.deriveKey(
      secretKey: SecretKey(
        utf8.encode(password),
      ),
      nonce: utf8.encode(salt),
    );

    return key;
  }

  @override
  Future<EncryptedTextDTO> encryptText(
    UnencryptedTextDTO unencryptedTextDTO,
  ) async {
    final SecretKey secretKey = await generateKey();

    final algoritm = AesCbc.with256bits(
      macAlgorithm: Hmac.sha256(),
    );

    final SecretBox secretBox = await algoritm.encrypt(
      utf8.encode(
        jsonEncode(unencryptedTextDTO),
      ),
      secretKey: secretKey,
      nonce: utf8.encode(supabase.auth.currentUser!.id).sublist(0, 16),
    );

    return EncryptedTextDTO(
      id: unencryptedTextDTO.id ?? StringConsts.emptyString,
      nonce: secretBox.nonce,
      mac: secretBox.mac.bytes,
      cipherText: secretBox.cipherText,
    );
  }

  @override
  Future<UnencryptedTextDTO> decryptText(
      EncryptedTextEntity encryptedTextEntity) async {
    final SecretKey secretKey = await generateKey();

    final algorithm = AesCbc.with256bits(
      macAlgorithm: Hmac.sha256(),
    );

    final SecretBox secretBox = SecretBox(
      encryptedTextEntity.cipherText,
      nonce: encryptedTextEntity.nonce,
      mac: Mac(encryptedTextEntity.mac),
    );

    final decryptedData = await algorithm.decrypt(
      secretBox,
      secretKey: secretKey,
    );

    return UnencryptedTextDTO.fromJson(
      jsonDecode(
        utf8.decode(decryptedData),
      ),
    );
  }

  @override
  Future<List<EncryptedTextDTO>> encryptTextList(
          List<UnencryptedTextDTO> texts) async =>
      Future.wait(
        texts
            .map(
              (UnencryptedTextDTO unencryptedTextDTO) async =>
                  await encryptText(unencryptedTextDTO),
            )
            .toList(),
      );

  @override
  Future<List<UnencryptedTextDTO>> decryptTextList(
          List<EncryptedTextEntity> texts) async =>
      Future.wait(
        texts
            .map(
              (EncryptedTextEntity encryptedTextEntity) async =>
                  await decryptText(encryptedTextEntity),
            )
            .toList(),
      );
}

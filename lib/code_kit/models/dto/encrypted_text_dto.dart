part of '../../code_kit.dart';

@freezed
class EncryptedTextDTO extends EncryptedTextEntity with _$EncryptedTextDTO {
  const factory EncryptedTextDTO({
    required String id,
    required List<int> nonce,
    required List<int> mac,
    required List<int> cipherText,
  }) = _EncryptedTextDTO;

  factory EncryptedTextDTO.fromJson(Map<String, dynamic> json) =>
      _$EncryptedTextDTOFromJson(json);
}

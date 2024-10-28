part of '../../code_kit.dart';

@freezed
class UnencryptedTextDTO extends UnencryptedTextEntity
    with _$UnencryptedTextDTO {
  const factory UnencryptedTextDTO({
    String? id,
    String? createdAt,
    String? userId,
    String? textTitle,
    String? text,
  }) = _UnencryptedTextDTO;

  factory UnencryptedTextDTO.fromJson(Map<String, dynamic> json) =>
      _$UnencryptedTextDTOFromJson(json);
}

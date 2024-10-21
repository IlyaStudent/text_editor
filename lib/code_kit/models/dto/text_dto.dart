part of '../../code_kit.dart';

@freezed
class TextDTO extends TextEntity with _$TextDTO {
  const factory TextDTO({
    int? id,
    String? createdAt,
    String? userId,
    String? textTitle,
    String? text,
  }) = _TextDTO;

  factory TextDTO.fromJson(Map<String, dynamic> json) =>
      _$TextDTOFromJson(json);
}

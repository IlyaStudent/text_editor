part of '../../code_kit.dart';

@freezed
class TextDTO extends TextEntity with _$TextDTO {
  const factory TextDTO({
    required int id,
    required String createdAt,
    required String userId,
    required String? textTitle,
    required String? text,
  }) = _TextDTO;

  factory TextDTO.fromJson(Map<String, dynamic> json) =>
      _$TextDTOFromJson(json);
}

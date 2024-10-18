part of '../code_kit.dart';

class TextEntity {
  final int id;
  final String createdAt;
  final String userId;
  final String? textTitle;
  final String? text;

  const TextEntity({
    required this.id,
    required this.createdAt,
    required this.userId,
    this.textTitle,
    this.text,
  });
}

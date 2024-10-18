part of '../code_kit.dart';

// @HiveType(typeId: 0)
class TextEntity {
  // @HiveField(0)
  final int id;

  // @HiveField(1)
  final String createdAt;

  // @HiveField(2)
  final String userId;

  // @HiveField(3)
  final String? textTitle;

  // @HiveField(4)
  final String? text;

  const TextEntity({
    required this.id,
    required this.createdAt,
    required this.userId,
    this.textTitle,
    this.text,
  });
}

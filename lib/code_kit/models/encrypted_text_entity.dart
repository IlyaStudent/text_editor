part of '../code_kit.dart';

@HiveType(typeId: 1)
class EncryptedTextEntity {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final List<int> nonce;

  @HiveField(2)
  final List<int> mac;

  @HiveField(3)
  final List<int> cipherText;

  EncryptedTextEntity({
    required this.id,
    required this.nonce,
    required this.mac,
    required this.cipherText,
  });
}

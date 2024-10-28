part of './../code_kit.dart';

abstract class ProfilesRepository {
  Future<void> writeSaltAndPassword({required String password});

  Future<String> getSalt();

  Future<String> getPassword();
}

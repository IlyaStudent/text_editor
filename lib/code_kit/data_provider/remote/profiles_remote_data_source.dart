part of '../../code_kit.dart';

abstract class ProfilesRemoteDataSource {
  Future<String> getSalt(String userId);
}

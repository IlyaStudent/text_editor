part of '../../code_kit.dart';

class ProfilesRemoteDataSourceImpl implements ProfilesRemoteDataSource {
  @override
  Future<String> getSalt(String userId) async {
    final secretKey = await supabase
        .from(StringConsts.profilesDB)
        .select(StringConsts.salt)
        .eq(StringConsts.idField, userId);

    return secretKey.first[StringConsts.salt];
  }
}

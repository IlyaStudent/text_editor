part of '../../code_kit.dart';

class TextsRemoteDataSourceImpl implements TextsRemoteDataSource {
  @override
  Future<UnencryptedTextDTO> createText(
      {required UnencryptedTextDTO unencryptedTextDTO}) async {
    final data = unencryptedTextDTO.toJson();
    data.remove(StringConsts.idField);
    final newData =
        await supabase.from(StringConsts.textsDB).insert(data).select();
    return UnencryptedTextDTO.fromJson(newData.first);
  }

  @override
  Future<List<UnencryptedTextDTO>> getAllTexts({required String userId}) async {
    final data = await supabase
        .from(StringConsts.textsDB)
        .select()
        .eq(StringConsts.userIdField, userId);
    return data.map((e) => UnencryptedTextDTO.fromJson(e)).toList();
  }

  @override
  Future<void> updateText(
      {required UnencryptedTextDTO unencryptedTextDTO}) async {
    await supabase
        .from(StringConsts.textsDB)
        .update(unencryptedTextDTO.toJson())
        .eq(StringConsts.idField, unencryptedTextDTO.id ?? 0);
  }

  @override
  Future<void> deleteTexts({required String userId}) async {
    await supabase
        .from(StringConsts.textsDB)
        .delete()
        .eq(StringConsts.userIdField, userId);
  }
}

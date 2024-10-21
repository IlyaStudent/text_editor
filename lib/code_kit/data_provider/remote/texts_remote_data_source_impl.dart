part of '../../code_kit.dart';

class TextsRemoteDataSourceImpl implements TextsRemoteDataSource {
  @override
  Future<TextDTO> createText({required TextDTO textDTO}) async {
    final data = textDTO.toJson();
    data.remove(StringConsts.idField);
    final newData =
        await supabase.from(StringConsts.textsDB).insert(data).select();
    return TextDTO.fromJson(newData.first);
  }

  @override
  Future<List<TextDTO>> getAllTexts({required String userId}) async {
    final data = await supabase.from(StringConsts.textsDB).select();
    return data.map((e) => TextDTO.fromJson(e)).toList();
  }

  @override
  Future<void> updateText({required TextDTO textDTO}) async {
    await supabase
        .from(StringConsts.textsDB)
        .update(textDTO.toJson())
        .eq(StringConsts.idField, textDTO.id ?? 0);
  }
}

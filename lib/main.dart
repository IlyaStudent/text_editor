import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/generated/l10n.dart';
import 'package:text_editor/root/navigation/app_router.dart';

part 'root/text_editor_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: StringConsts.envFileName);
  Hive.initFlutter();
  Hive.registerAdapter(
    TextEntityAdapter(),
  );
  await Supabase.initialize(
    url: dotenv.env[StringConsts.envUrlKey] ?? StringConsts.emptyString,
    anonKey: dotenv.env[StringConsts.envAnonKey] ?? StringConsts.emptyString,
  );
  init();
  runApp(const TextEditorApp());
}

final supabase = Supabase.instance.client;

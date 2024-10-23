library on_borading;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';
import 'package:text_editor/ui_kit/ui_kit.dart';

// pages
part 'pages/on_borading_page.dart';

// widgets
part 'widgets/on_boarding_form.dart';

// bloc
part 'bloc/on_boarding_cubit.dart/on_boarding_cubit.dart';
part 'bloc/on_boarding_cubit.dart/on_boarding_state.dart';

// generated
part 'on_boarding.freezed.dart';

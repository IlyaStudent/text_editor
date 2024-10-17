library settings;

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';
import 'package:text_editor/ui_kit/ui_kit.dart';

// pages
part 'pages/settings_page.dart';

// widgets

// bloc
part 'bloc/settings_bloc/settings_bloc.dart';
part 'bloc/settings_bloc/settings_event.dart';
part 'bloc/settings_bloc/settings_state.dart';

// generated
part 'settings.freezed.dart';

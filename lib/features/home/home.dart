library home;

import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';
import 'package:text_editor/ui_kit/ui_kit.dart';

// pages
part 'pages/home_page.dart';
part 'pages/text_page.dart';
part 'pages/add_text_page.dart';

// widgets
part 'widgets/texts_widget.dart';
part 'widgets/text_widget.dart';

// bloc
part 'bloc/home_bloc/home_bloc.dart';
part 'bloc/home_bloc/home_event.dart';
part 'bloc/home_bloc/home_state.dart';

// generated
part 'home.freezed.dart';

library authorization;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';
import 'package:text_editor/ui_kit/ui_kit.dart';

// pages
part 'pages/authorization_page.dart';

// widgets
part 'widgets/authorization_form_widget.dart';

// entities
part 'models/authorization_enity.dart';
part 'models/authorization_error_entity.dart';

// dto
part 'models/dto/authorization_dto.dart';
part 'models/dto/authorization_error_dto.dart';

// bloc
part 'bloc/authorization_bloc/authorization_bloc.dart';
part 'bloc/authorization_bloc/authorization_event.dart';
part 'bloc/authorization_bloc/authorization_state.dart';

//generated
part 'authorization.g.dart';
part 'authorization.freezed.dart';

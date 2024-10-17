library registration;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';
import 'package:text_editor/ui_kit/ui_kit.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

//screens
part 'pages/registration_page.dart';

// widgets
part 'widgets/registration_form_widget.dart';

// bloc
part 'bloc/registration_bloc/registration_bloc.dart';
part 'bloc/registration_bloc/registration_event.dart';
part 'bloc/registration_bloc/registration_state.dart';

//entities
part 'models/registration_error_entity.dart';

// dto
part 'models/dto/registration_error_dto.dart';

// generated
part 'registration.freezed.dart';
part 'registration.g.dart';

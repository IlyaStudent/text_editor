library code_kit;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:text_editor/features/authorization/authorization.dart';
import 'package:text_editor/features/registration/registration.dart';
import '../generated/l10n.dart';

// consts
part 'consts/string_consts.dart';

// extensions
part 'extensions/content_extension.dart';

// di
part 'dependency_injection/dependency_injection.dart';

// entities
part 'models/dto/authorization_dto.dart';
part 'models/dto/registration_dto.dart';

// dto
part 'models/authorization_enity.dart';
part 'models/registration_entity.dart';

// repositories
part 'repositories/autentithication_repository.dart';
part 'repositories/autentithication_repository_impl.dart';

// helpers
part 'helpers/validation_helpers/registration_validator.dart';
part 'helpers/validation_helpers/validator.dart';
part 'helpers/validation_helpers/authorization_validator.dart';
part 'helpers/validation_helpers/validate_functions.dart';

// generated
part 'code_kit.freezed.dart';
part 'code_kit.g.dart';

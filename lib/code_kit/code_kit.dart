library code_kit;

import 'package:flutter/material.dart';
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

// helpers
part 'helpers/validation_helpers/registration_validator.dart';
part 'helpers/validation_helpers/validator.dart';
part 'helpers/validation_helpers/authorization_validator.dart';
part 'helpers/validation_helpers/validate_functions.dart';

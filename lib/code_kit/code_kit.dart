library code_kit;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

// dto
part 'models/dto/authorization_dto.dart';
part 'models/dto/registration_dto.dart';
part 'models/dto/text_dto.dart';

// entity
part 'models/authorization_enity.dart';
part 'models/registration_entity.dart';
part 'models/text_entity.dart';

// data provider - remote
part 'data_provider/remote/texts_remote_data_source.dart';
part 'data_provider/remote/texts_remote_data_source_impl.dart';

// data provider - local tables
// part 'data_provider/local/tables/text_local_model.dart';

// data provider - local data sources
part 'data_provider/local/texts_local_data_source.dart';
part 'data_provider/local/texts_local_data_souce_impl.dart';

// repositories
part 'repositories/autentithication_repository.dart';
part 'repositories/autentithication_repository_impl.dart';
part 'repositories/texts_repository.dart';
part 'repositories/texts_repository_impl.dart';

// helpers
part 'helpers/validation_helpers/registration_validator.dart';
part 'helpers/validation_helpers/validator.dart';
part 'helpers/validation_helpers/authorization_validator.dart';
part 'helpers/validation_helpers/validate_functions.dart';

// generated
part 'code_kit.freezed.dart';
part 'code_kit.g.dart';

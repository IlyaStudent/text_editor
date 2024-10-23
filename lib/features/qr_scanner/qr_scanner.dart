library qrScanner;

import 'dart:convert';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/root/navigation/app_router.dart';

// pages
part 'pages/qr_scanner_page.dart';

// widgets
part 'widgets/corned_border_painer.dart';

// bloc
part 'bloc/qr_scanner/qr_scanner_cubit.dart';
part 'bloc/qr_scanner/qr_scanner_state.dart';

// generated
part 'qr_scanner.freezed.dart';

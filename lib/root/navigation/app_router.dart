import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:text_editor/code_kit/code_kit.dart';
import 'package:text_editor/features/authorization/authorization.dart';
import 'package:text_editor/features/home/home.dart';
import 'package:text_editor/features/on_boarding/on_boarding.dart';
import 'package:text_editor/features/registration/registration.dart';
import 'package:text_editor/features/settings/settings.dart';

part 'app_router.gr.dart';
part 'nav_bar_page.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NavBarRoute.page,
          initial: true,
          path: StringConsts.navBarPath,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: StringConsts.homePath,
            ),
            AutoRoute(
              page: SettingsRoute.page,
              path: StringConsts.settingsPath,
            ),
          ],
        ),
        AutoRoute(
          page: OnBoradingRoute.page,
          path: StringConsts.onBoardingRoute,
          initial: false,
        ),
        AutoRoute(
          page: AuthorizationRoute.page,
          path: StringConsts.authorizationRoute,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
          path: StringConsts.registrationRoute,
        ),
        AutoRoute(
          page: TextRoute.page,
          path: StringConsts.textPath,
        ),
        AutoRoute(
          page: AddTextRoute.page,
          path: StringConsts.addTextPath,
        )
      ];
}

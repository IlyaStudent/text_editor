import 'package:auto_route/auto_route.dart';
import 'package:text_editor/features/authorization/authorization.dart';
import 'package:text_editor/features/home/home.dart';
import 'package:text_editor/features/on_boarding/on_boarding.dart';
import 'package:text_editor/features/registration/registration.dart';
import 'package:text_editor/features/settings/settings.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: OnBoradingRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: AuthorizationRoute.page,
        ),
        AutoRoute(
          page: RegistrationRoute.page,
        ),
        AutoRoute(
          page: HomeRoute.page,
        ),
        AutoRoute(
          page: SettingsRoute.page,
        ),
      ];
}

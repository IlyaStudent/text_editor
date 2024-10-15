import 'package:auto_route/auto_route.dart';
import 'package:text_editor/features/authorization/authorization.dart';
import 'package:text_editor/features/on_borading/on_borading.dart';
import 'package:text_editor/features/registration/registration.dart';

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
        )
      ];
}

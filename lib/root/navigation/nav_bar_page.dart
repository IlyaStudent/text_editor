part of 'app_router.dart';

@RoutePage()
class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      builder: (context, child) {
        final currentIndex = context.autoTabsRouter.activeIndex;
        return Scaffold(
          appBar: AppBar(
            title: Text(currentIndex == 0
                ? context.localization.home
                : context.localization.settings),
          ),
          body: child,
          drawer: Drawer(
            child: Wrap(
              runSpacing: 16,
              children: [
                Container(
                  width: double.infinity,
                  height: context.deviceHeight * 0.2,
                  color: context.colorScheme.primary,
                  child: Center(
                    child: Text(
                      StringConsts.appName,
                      style: context.textTheme.headlineLarge
                          ?.copyWith(color: context.colorScheme.onPrimary),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                ListTile(
                  leading: const Icon(Icons.home_rounded),
                  title: Text(context.localization.home),
                  onTap: () => context.autoTabsRouter
                    ..setActiveIndex(0)
                    ..maybePop(),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: Text(context.localization.settings),
                  onTap: () => context.autoTabsRouter
                    ..setActiveIndex(1)
                    ..maybePop(),
                ),
                const Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}

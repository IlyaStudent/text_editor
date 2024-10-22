part of '../settings.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(
        textsRepository: instance(),
        settingsRepository: instance(),
      )..add(
          const SettingsEvent.loadSettingsData(),
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<SettingsBloc>().state;
    bool loading = false;
    bool online = true;
    bool encryption = true;
    state.when(
      initial: (onlineMode, encryptionMode) {
        online = onlineMode;
        encryption = encryptionMode;
      },
      loading: () => loading = true,
      actionCompleted: (signedOut) => context.router.pushAll(
        [signedOut ? const OnBoradingRoute() : const NavBarRoute()],
      ),
    );

    return Scaffold(
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  minVerticalPadding: 16,
                  title: Text(context.localization.onlineMode),
                  trailing: Switch(
                    value: online,
                    onChanged: (bool value) => context.settingsBloc.add(
                      SettingsEvent.changeMode(
                        changedValue: StringConsts.onlineMode,
                        value: value,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 16,
                  title: Text(context.localization.encryptionMode),
                  trailing: Switch(
                    value: encryption,
                    onChanged: (bool value) => context.settingsBloc.add(
                      SettingsEvent.changeMode(
                        changedValue: StringConsts.encryptionMode,
                        value: value,
                      ),
                    ),
                  ),
                ),
                CustomListTileButton(
                  titleText: context.localization.deleteAllData,
                  onTap: () => context.settingsBloc.add(
                    const SettingsEvent.deleteAllData(),
                  ),
                ),
                CustomListTileButton(
                  titleText: context.localization.signOut,
                  onTap: () => context.settingsBloc.add(
                    const SettingsEvent.signOut(),
                  ),
                ),
              ],
            ),
    );
  }
}

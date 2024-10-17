part of '../home.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomFilledButton(
          text: context.localization.settingsPage,
          onPressed: () => context.router.push(
            const SettingsRoute(),
          ),
        ),
      ),
    );
  }
}

part of '../code_kit.dart';

extension ContentExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  TabsRouter get autoTabsRouter => AutoTabsRouter.of(this);
  S get localization => S.of(this);
  double get deviceHeight => MediaQuery.sizeOf(this).height;
  double get deviceWidth => MediaQuery.sizeOf(this).width;
}

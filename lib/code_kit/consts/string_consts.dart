part of '../code_kit.dart';

class StringConsts {
  static const String emptyString = "";

  // reg exp
  static const String regEmailValidate = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";

  // env strings
  static const String envFileName = ".env";
  static const String envUrlKey = "URL";
  static const String envAnonKey = "ANON_KEY";

  // ui strings
  static const String appName = "TextEditor";

  // route path
  static const String onBoardingRoute = "/onBoarding";
  static const String authorizationRoute = "/auth";
  static const String registrationRoute = "/reg";

  // textfield names
  static const String email = "email";
  static const String password = "password";
  static const String plainPassword = "plainPassword";
  static const String confirmPassword = "confirmPassword";
  static const String isValid = "isValid";
}

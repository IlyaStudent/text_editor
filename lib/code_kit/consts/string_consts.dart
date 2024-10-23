part of '../code_kit.dart';

class StringConsts {
  static const String emptyString = "";

  // reg exp
  static const String regEmailValidate = r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$";
  static const String dateTimeParse = "d.M.y";

  // env strings
  static const String envFileName = ".env";
  static const String envUrlKey = "URL";
  static const String envAnonKey = "ANON_KEY";

  // ui strings
  static const String appName = "TextEditor";

  // hive
  static const String textBox = "textBox";

  // route path
  static const String onBoardingRoute = "/";
  static const String authorizationRoute = "/auth";
  static const String registrationRoute = "/reg";
  static const String navBarPath = "/navBar";
  static const String homePath = "home";
  static const String settingsPath = "settings";
  static const String textPath = "/text";
  static const String addTextPath = "/addText";
  static const String qrScannerPath = "/qrScanner";

  // textfield names
  static const String email = "email";
  static const String password = "password";
  static const String plainPassword = "plainPassword";
  static const String confirmPassword = "confirmPassword";
  static const String isValid = "isValid";

  // supabase
  static const String textsDB = "texts";
  static const String idField = "id";
  static const String createdAtField = "createdAt";
  static const String userIdField = "userId";
  static const String textTitleField = "textTitle";
  static const String textField = "text";

  // hero tag
  static const String addButton = "addButton";
  static const String downloadButton = "downloadButton";
  static const String toggleButton = "toggleButton";
  static const String scanButton = "scanButton";

  // shared prefernces
  static const String onlineMode = "onlineMode";
  static const String encryptionMode = "encryptionMode";
}

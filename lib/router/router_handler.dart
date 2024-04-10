import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:package_name_manager/ui/pages/forgot_password/forgot_password_page.dart';
import 'package:package_name_manager/ui/pages/home/home_page.dart';
import 'package:package_name_manager/ui/pages/sign_in/sign_in_page.dart';
import 'package:package_name_manager/ui/pages/sign_up/sign_up_page.dart';
import 'package:package_name_manager/ui/pages/splash/splash_page.dart';

Handler notHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      Scaffold(
    body: Center(
      child: Text('$params'),
    ),
  ),
);

Handler splashHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SplashPage(),
);

///Auth
Handler signInHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SignInPage();
});
Handler signUpHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const SignUpPage();
});
Handler forgotPasswordHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const ForgotPasswordPage();
});

///Home
Handler homeHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return const HomePage();
});

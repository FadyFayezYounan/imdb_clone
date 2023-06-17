import 'package:flutter/material.dart';

class AppNavigator {
  static void navigateNamedTo(BuildContext context, String route,
          {var arguments}) =>
      Navigator.pushNamed(context, route, arguments: arguments);

  static void navigateNamedReplace(BuildContext context, String route,
          {var arguments}) =>
      Navigator.pushReplacementNamed(context, route, arguments: arguments);

  static void navigateNamedFinish(BuildContext context, String route,
          {var arguments}) =>
      Navigator.pushNamedAndRemoveUntil(context, route, (route) => false,
          arguments: arguments);

  static void pop<T>(BuildContext context, [T? result]) {
    Navigator.pop<T>(context, result);
  }
}

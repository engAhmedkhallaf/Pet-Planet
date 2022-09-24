import 'package:flutter/material.dart';

void navigateAndRemove(context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
  );
  debugPrint('REMOVE ALL ROUTES & MOVING TO: $routeName');
}

void navigateTo(context, String routeName) {
  Navigator.pushNamed(
    context,
    routeName,
  );
  debugPrint('MOVING TO: $routeName');
}


void navigateToWithArguments(
  context,
  String routeName,
  Object? arguments,
) {
  Navigator.pushNamed(
    context,
    routeName,
    arguments: arguments,
  );
  debugPrint('MOVING TO: $routeName');
}


void navigateBack(context) {
  Navigator.pop(
    context,
  );
  debugPrint('CLOSE: $context');
}

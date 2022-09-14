import 'package:flutter/material.dart';

void navigateAndRemove(context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
  );
  print('REMOVE ALL ROUTES & MOVING TO: $routeName');
}

void navigateTo(context, String routeName) {
  Navigator.pushNamed(
    context,
    routeName,
  );
  print('MOVING TO: $routeName');
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
  print('MOVING TO: $routeName');
}


void navigateBack(context) {
  Navigator.pop(
    context,
  );
  print('CLOSE: $context');
}

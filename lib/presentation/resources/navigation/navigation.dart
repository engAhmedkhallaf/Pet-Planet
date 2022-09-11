import 'package:flutter/material.dart';

void navigatorAndRemove(context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
  );
  print('REMOVE ALL ROUTES & MOVING TO: $routeName');
}

void navigatorTo(context, String routeName) {
  Navigator.pushNamed(
    context,
    routeName,
  );
  print('MOVING TO: $routeName');
}

void navigateBack(context) {
  Navigator.pop(
    context,
  );
  print('CLOSE: $context');
}

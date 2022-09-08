import 'package:flutter/material.dart';

void navigatorAndRemove(context, String routeName) {
  Navigator.pushNamedAndRemoveUntil(
    context,
    routeName,
    (route) => false,
  );
}

void navigatorTo(context, String routeName) {
  Navigator.pushNamed(
    context,
    routeName,
  );
}

import 'package:flutter/material.dart';

class ColorManager {
  //Main Colors
  static const Color transparent = Colors.transparent;
  static const Color background = Color(0xff040404);
  static const Color primaryColor = Color(0xffdb0e0e);
  static const Color secondaryColor = Color(0xffe2e2e0);

  //Secondary Colors
  static const Color grey = Color(0xff737477);
  static const Color lightGrey = Color(0xffBFBCAF);
  static const Color cloud = Color(0xff757b88);
  static const Color lightCloud = Color(0xff78868a);

  // Static Colors
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);

 static MaterialColor mainColorSwatch = MaterialColor(
    primaryColor.value,
    const <int, Color>{
      50: Color(0xffFBE2E2),
      100: Color(0xffF4B7B7),
      200: Color(0xffED8787),
      300: Color(0xffE65656),
      400: Color(0xffE03232),
      500: primaryColor,
      600: Color(0xffD70C0C),
      700: Color(0xffD20A0A),
      800: Color(0xffCD0808),
      900: Color(0xffC40404),
    },
  );
}

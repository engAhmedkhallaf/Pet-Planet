import 'package:flutter/material.dart';

const String imagePath = "assets/images";
const String iconPath = "assets/icons";
const String svgPath = "assets/svgs";

class AssetsManager {
  static const String splashLogo = "$imagePath/pet-planet.png";
  static const String petLogo = "$imagePath/pet.png";
  static const String authBackground = "$imagePath/auth-background.png";
  static const String noImage = "$imagePath/no-photo.png";
  static const String noImageUrl =
      "'https://firebasestorage.googleapis.com/v0/b/petplanet-d7aa8.appspot.com/o/no-photo.png?alt=media&token=4e59300e-d2ac-4613-a788-ab2d198f6018'";
  static const String plus = "$iconPath/plus.png";
  static const String orderSuccess = "$svgPath/order-success.svg";
}

class IconBroken {
  IconBroken._();

  static const String _fontFamily = 'IconlyBroken';

  static const IconData user = IconData(0xe900, fontFamily: _fontFamily);
  static const IconData user1 = IconData(0xe901, fontFamily: _fontFamily);
  static const IconData arrowleft_2 = IconData(0xe909, fontFamily: _fontFamily);
  static const IconData cart = IconData(0xe91b, fontFamily: _fontFamily);
  static const IconData call = IconData(0xe91f, fontFamily: _fontFamily);
  static const IconData camera = IconData(0xe921, fontFamily: _fontFamily);
  static const IconData delete = IconData(0xe927, fontFamily: _fontFamily);
  static const IconData discount = IconData(0xe928, fontFamily: _fontFamily);
  static const IconData editSquare = IconData(0xe92c, fontFamily: _fontFamily);
  static const IconData edit = IconData(0xe92d, fontFamily: _fontFamily);
  static const IconData heart = IconData(0xe933, fontFamily: _fontFamily);
  static const IconData home = IconData(0xe935, fontFamily: _fontFamily);
  static const IconData location = IconData(0xe93a, fontFamily: _fontFamily);
  static const IconData login = IconData(0xe93c, fontFamily: _fontFamily);
  static const IconData logout = IconData(0xe93d, fontFamily: _fontFamily);
  static const IconData message = IconData(0xe93e, fontFamily: _fontFamily);
  static const IconData password = IconData(0xe948, fontFamily: _fontFamily);
  static const IconData plus = IconData(0xe94a, fontFamily: _fontFamily);
  static const IconData profile = IconData(0xe94b, fontFamily: _fontFamily);
  static const IconData search = IconData(0xe94d, fontFamily: _fontFamily);
  static const IconData timeCircle = IconData(0xe958, fontFamily: _fontFamily);
}

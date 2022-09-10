import 'package:flutter/material.dart';
import '../colors/color_manager.dart';
import '../fonts/font_manager.dart';
import '../styles/style_manager.dart';
import '../values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of application
    primaryColor: ColorManager.primaryColor,
    disabledColor: ColorManager.grey,
    primarySwatch: ColorManager.mainColorSwatch,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

    // card view theme
    cardTheme: const CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primaryColor,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primaryColor,

      ///TODO:
      titleTextStyle: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s16),
    ),

    // button theme
    buttonTheme: const ButtonThemeData(
      shape: StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primaryColor,
      splashColor: ColorManager.primaryColor,
    ),

    // Elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s18,
        ),
        minimumSize: const Size(double.infinity, 55),
        // padding: EdgeInsets.all(5),
        backgroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
      ),
    ),

    // Outlined button theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        textStyle: getBoldStyle(
          color: ColorManager.primaryColor,
          fontSize: FontSizeManager.s18,
        ),
        minimumSize: const Size(double.infinity, 55),
        // padding: EdgeInsets.all(5),
        backgroundColor: ColorManager.white,
        foregroundColor: ColorManager.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s50),
        ),
        side: const BorderSide(
          color: ColorManager.primaryColor,
          width: AppSize.s1,
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      headline1: getMediumStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s24),
      headline2: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s20),
      headline3: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s18),
      headline4: getBoldStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s34),
      headline5: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s18),
      subtitle1: getRegularStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s18),
      subtitle2: getRegularStyle(
          color: ColorManager.primaryColor, fontSize: FontSizeManager.s14),
      caption: getRegularStyle(color: ColorManager.grey),
      bodyText1: getRegularStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s16),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey),

      // label style
      labelStyle: getRegularStyle(color: ColorManager.white),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.primaryColor),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primaryColor, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}

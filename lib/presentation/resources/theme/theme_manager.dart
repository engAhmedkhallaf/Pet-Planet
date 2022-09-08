import 'package:flutter/material.dart';
import '../colors/color_manager.dart';
import '../fonts/font_manager.dart';
import '../styles/style_manager.dart';
import '../values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    // main colors of application
    primaryColor: ColorManager.primary,
    disabledColor: ColorManager.grey,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primary, ///TODO:
      titleTextStyle: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s16),
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primary,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getBoldStyle(color: ColorManager.white,fontSize: FontSizeManager.s18),
        minimumSize: const Size(double.infinity, 60),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
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
          color: ColorManager.white, fontSize: FontSizeManager.s18),
      headline5: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s18),
      subtitle1: getRegularStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s18),
      subtitle2: getRegularStyle(
          color: ColorManager.primary, fontSize: FontSizeManager.s14),
      caption: getRegularStyle(color: ColorManager.grey),
      bodyText1: getRegularStyle(color: ColorManager.grey),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey),

      // label style
      labelStyle: getRegularStyle(color: ColorManager.white),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.primary),

      // enabled border
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
  );
}

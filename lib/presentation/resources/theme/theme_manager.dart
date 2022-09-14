import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    scaffoldBackgroundColor: ColorManager.transparent,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

    iconTheme: const IconThemeData(size: FontSizeManager.s15),

    // Progress Indicator Theme
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: ColorManager.primaryColor,
      circularTrackColor: ColorManager.lightGrey,
    ),

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
      titleTextStyle: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s16),
    ),

    // bottom navigation bar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: ColorManager.primaryColor,
      unselectedItemColor: ColorManager.grey,
      backgroundColor: ColorManager.black,
      elevation: AppSize.s20,
      selectedIconTheme: IconThemeData(
        size: AppSize.s25.w,
      ),
      unselectedIconTheme: IconThemeData(
        size: AppSize.s20.w,
      ),
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

    // Text button theme
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: const MaterialStatePropertyAll(ColorManager.grey),
        textStyle: MaterialStatePropertyAll(
          TextStyle(
            fontSize: AppSize.s16.sp,
            color: ColorManager.white,
            fontWeight: FontWeightManager.bold,
            fontFamily: FontConstants.fontFamily,
          ),
        ),
      ),
    ),

    // text theme
    textTheme: TextTheme(
      // DISPLAY REGULAR

      displayLarge: getBoldStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s50.sp),
      displayMedium: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s45.sp),
      displaySmall: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s36.sp),

      // HEADLINE REGULAR
      headlineLarge: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s32.sp),
      headlineMedium: getRegularStyle(
          color: ColorManager.white, fontSize: FontSizeManager.s28.sp),
      headlineSmall: getRegularStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s20.sp),

      // TITLE MEDIUM
      titleLarge: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s22.sp),
      titleMedium: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s16.sp),
      titleSmall: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14.sp),

      // LABEL MEDIUM
      labelLarge: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s14.sp),
      labelMedium: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s12.sp),
      labelSmall: getMediumStyle(
          color: ColorManager.lightGrey, fontSize: FontSizeManager.s11.sp),

      // BODY MEDIUM
      bodyLarge: getMediumStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s16.sp),
      bodyMedium: getRegularStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s14.sp),
      bodySmall: getRegularStyle(
          color: ColorManager.grey, fontSize: FontSizeManager.s12.sp),
    ),

    // input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.lightGreyWithOpacity_10,

      // Content padding
      contentPadding: EdgeInsets.symmetric(
        horizontal: AppPadding.p28.w,
        vertical: AppPadding.p12.h,
      ),

      // Floating Label Style
      // floatingLabelStyle: const TextStyle(color: ColorManager.grey),

      // hint style
      hintStyle: getRegularStyle(color: ColorManager.grey),

      // label style
      labelStyle: getRegularStyle(color: ColorManager.grey).copyWith(
        fontSize: FontSizeManager.s16,
      ),

      // error style
      errorStyle: getRegularStyle(color: ColorManager.errorColor),

      // Suffix
      suffixIconColor: ColorManager.primaryColor,
      suffixStyle: TextStyle(fontSize: AppSize.s10.w),

      // Prefix
      prefixIconColor: ColorManager.mainColorSwatch.shade800,
      prefixStyle: TextStyle(fontSize: AppSize.s10.w),

      // enabled border
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s50)),
        borderSide: BorderSide(
          color: ColorManager.transparent,
          width: AppSize.s1_5,
        ),
      ),

      // disabled border
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s50)),
        borderSide: BorderSide(
          color: ColorManager.transparent,
          width: AppSize.s1_5,
        ),
      ),

      // focused border
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s50)),
        borderSide: BorderSide(
          color: ColorManager.white,
          width: AppSize.s1,
        ),
      ),

      // error border
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s50)),
        borderSide: BorderSide(
          color: ColorManager.errorColor,
          width: AppSize.s1,
        ),
      ),

      // focused error border
      focusedErrorBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.white,
          width: AppSize.s1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s50)),
      ),
    ),
  );
}

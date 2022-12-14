import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

showAlertDialog(
  BuildContext context,
  Widget title,
  Widget content,
  List<Widget>? actions,
) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.primaryColor,
          title: title,
          
          titleTextStyle: getApplicationTheme().textTheme.titleLarge!.copyWith(
                color: ColorManager.white,
                fontWeight: FontWeightManager.bold,
              ),
          titlePadding: const EdgeInsets.all(AppPadding.p10),
          content: content,
          contentTextStyle: getApplicationTheme()
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorManager.white),
          contentPadding: const EdgeInsets.all(AppPadding.p10),
          actions: actions,
          // actionsPadding: const EdgeInsets.all(AppPadding.p10),
          actionsAlignment: MainAxisAlignment.end,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s32),
            ),
          ),
        );
      });
}
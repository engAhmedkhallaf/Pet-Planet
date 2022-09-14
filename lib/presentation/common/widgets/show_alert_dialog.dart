import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

showAlertDialog(
  BuildContext context,
  String title,
  String content,
  // List<Widget>? widgetChilren,
) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorManager.primaryColor,
          title: Center(child: Text(title)),
          titleTextStyle: getApplicationTheme().textTheme.titleLarge!.copyWith(
                color: ColorManager.white,
                fontWeight: FontWeightManager.bold,
              ),
          titlePadding: const EdgeInsets.all(AppPadding.p10),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(content),
            ],
          ),
          contentTextStyle: getApplicationTheme()
              .textTheme
              .bodyLarge!
              .copyWith(color: ColorManager.white),
          contentPadding: const EdgeInsets.all(AppPadding.p10),
          actions: [
            TextButton(
              style: getApplicationTheme().textButtonTheme.style!.copyWith(
                    shape: const MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(AppSize.s32),
                        ),
                      ),
                    ),
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.white),
                    foregroundColor: const MaterialStatePropertyAll(
                        ColorManager.primaryColor),
                  ),
              onPressed: () {
                navigateBack(context);
              },
              child: const Text("OK"),
            ),
          ],
          // actionsPadding: const EdgeInsets.all(AppPadding.p10),
          actionsAlignment: MainAxisAlignment.end,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(AppSize.s32))),
        );
      });
}

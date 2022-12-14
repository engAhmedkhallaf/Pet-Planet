import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void errorSnackBar({
  required BuildContext context,
  required String message,
}) {
  return showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.info(
      message: message,
      backgroundColor: ColorManager.primaryColor,
    ),
  );
}

void successSnackBar({
  required BuildContext context,
  required String message,
}) {
  return showTopSnackBar(
    Overlay.of(context)!,
    CustomSnackBar.info(
      message: message,
      backgroundColor: ColorManager.white,
      textStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
        color: Colors.black,
      ),
    ),
    padding: const EdgeInsets.all(AppPadding.p10),
    dismissDirection: [DismissDirection.horizontal],
  );
}
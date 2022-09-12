import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void mySnackBar({required BuildContext context, required String message,}) {
  return showTopSnackBar(
    context,
    CustomSnackBar.info(
      message: message,
      backgroundColor: ColorManager.primaryColor,
    ),
  );
}

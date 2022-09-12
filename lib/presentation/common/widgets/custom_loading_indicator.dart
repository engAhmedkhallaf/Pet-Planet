import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';

class CustomLoadingIndicator extends StatelessWidget {
  const CustomLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorManager.primaryColor,
    );
  }
}

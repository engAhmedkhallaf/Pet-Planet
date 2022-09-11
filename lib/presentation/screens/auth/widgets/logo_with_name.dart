import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class AuthLogoWithName extends StatelessWidget {
  const AuthLogoWithName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: AppSize.s15.h,
        ),
        Image.asset(
          AssetsManager.petLogo,
          fit: BoxFit.fill,
          width: 0.25.sw,
          // height: 90.w,
        ),
        SizedBox(
          height: AppSize.s10.h,
        ),
        Text.rich(
          TextSpan(
            text: AppStrings.pets,
            style: getApplicationTheme().textTheme.headlineLarge!.copyWith(
                  // fontWeight: FontWeightManager.bold,
                  color: ColorManager.primaryColor,
                ),
            children: const [
              TextSpan(
                text: ' ${AppStrings.planet}',
                style: TextStyle(
                  color: ColorManager.white,
                ),
              ),
            ],
          ),
        ),
        Text(
          AppStrings.foodDelivery,
          style: getApplicationTheme().textTheme.bodySmall!.copyWith(
                color: ColorManager.white,
                letterSpacing: 4.w,
                fontSize: AppSize.s10.sp,
              ),
        ),
      ],
    );
  }
}

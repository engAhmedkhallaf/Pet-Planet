import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/auth_painter.dart';
import 'package:pet_planet/presentation/screens/auth/widgets/logo_with_name.dart';

class AuthLayoutScreen extends StatelessWidget {
  const AuthLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          const AuthPainter(),
          const AuthLogoWithName(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.s16.w,
              vertical: AppSize.s20.w,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  AppStrings.desc,
                  style: getApplicationTheme().textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppSize.s25.h,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.login,
                  ),
                ),
                SizedBox(
                  height: AppSize.s16.h,
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text(
                    AppStrings.createAnAccount,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

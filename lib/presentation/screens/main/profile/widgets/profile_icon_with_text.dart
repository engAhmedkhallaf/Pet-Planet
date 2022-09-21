import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class ProfileIconWithText extends StatelessWidget {
  const ProfileIconWithText({
    super.key,
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: ColorManager.grey,
          size: FontSizeManager.s18.sp,
        ),
        SizedBox(
          width: AppSize.s15.w,
        ),
        Text(
          text,
          style: getApplicationTheme().textTheme.bodyLarge,
        ),
      ],
    );
  }
}

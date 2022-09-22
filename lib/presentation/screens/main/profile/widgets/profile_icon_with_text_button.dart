import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class ProfileIconWithTextButton extends StatelessWidget {
  ProfileIconWithTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color = ColorManager.grey,
  });

  final IconData icon;
  final String text;
  void Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppPadding.p10.w),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: FontSizeManager.s25.sp,
            ),
            SizedBox(
              width: AppSize.s18.w,
            ),
            Text(
              text,
              style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                    fontSize: FontSizeManager.s18.sp,
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

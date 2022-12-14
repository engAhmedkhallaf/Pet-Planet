import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

// ignore: must_be_immutable
class ProfileIconWithTextButton extends StatelessWidget {
  ProfileIconWithTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.color = ColorManager.grey,
    this.padding =AppPadding.p10,
  });

  final IconData icon;
  final String text;
  void Function() onTap;
  final Color color;
 final double padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: padding.w),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
              size: FontSizeManager.s22.sp,
            ),
            SizedBox(
              width: AppSize.s18.w,
            ),
            Text(
              text,
              style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                    fontSize: FontSizeManager.s17.sp,
                    color: color,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';

import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class CustomAppBarWithWishlist extends StatelessWidget
    with PreferredSizeWidget {
  CustomAppBarWithWishlist({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          navigateBack(context);
        },
        splashColor: ColorManager.primaryColor,
        tooltip: AppStrings.back,
        icon: Icon(
          IconBroken.Arrow___Left_2,
          color: ColorManager.grey,
          size: AppSize.s25.w,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: getBoldStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s20.sp,
        ).copyWith(letterSpacing: FontSizeManager.s1.w),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(right: AppPadding.p5.w),
          child: IconButton(
            onPressed: () {
              navigateTo(context, Routes.wishlistRoute);
            },
            splashColor: ColorManager.primaryColor,
            tooltip: AppStrings.openWishlist,
            icon: Icon(
              IconBroken.Heart,
              color: ColorManager.grey,
              size: AppSize.s25.w,
            ),
          ),
        ),
      ],
      backgroundColor: ColorManager.transparent,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 60);
}

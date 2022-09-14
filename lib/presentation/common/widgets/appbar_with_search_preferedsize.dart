import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class AppBarWithSearch extends StatelessWidget {
  const AppBarWithSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          AppPadding.p150.h,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: AppPadding.p20.w,
                  right: AppPadding.p20.w,
                  top: AppPadding.p8.w,
                ),
                child: Text(
                  AppStrings.home,
                  style: getBoldStyle(
                    color: ColorManager.grey,
                    fontSize: FontSizeManager.s20,
                  ).copyWith(letterSpacing: FontSizeManager.s1.w),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p20.w,
                  vertical: AppPadding.p20.h,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: AppStrings.search,
                    hintStyle: getApplicationTheme()
                        .inputDecorationTheme
                        .hintStyle!
                        .copyWith(
                          fontSize: FontSizeManager.s16.sp,
                        ),
                    prefixIcon: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          size: FontSizeManager.s20.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
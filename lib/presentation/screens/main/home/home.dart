import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/home/widgets/home_category_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          AppStrings.home,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.transparent,
        elevation: 0.0,
        bottom: PreferredSize(
          preferredSize: Size(
            double.infinity,
            AppPadding.p80.h,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p20.w,
              vertical: AppPadding.p16.h,
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
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p28.w,
                  vertical: AppPadding.p8.h,
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
                  child: IconButton(
                    onPressed: () {
                      //TODO: Search
                    },
                    icon: Icon(
                      Icons.search,
                      size: FontSizeManager.s20.sp,
                    ),
                  ),
                ),
              ),
              cursorColor: ColorManager.primaryColor,
            ),
          ),
        ),
      ),
      body: const HomeCategoryList(),
    );
  }
}

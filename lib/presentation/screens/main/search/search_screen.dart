import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/business_logic/blocs/search_bloc/search_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/search/widgets/search_product_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateBack(context);
          },
          splashColor: ColorManager.primaryColor,
          tooltip: AppStrings.back,
          icon: Icon(
            IconBroken.arrowleft_2,
            color: ColorManager.grey,
            size: AppSize.s25.w,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.search,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          if (state is SearchLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SearchLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p20.w,
                      vertical: AppPadding.p20.h,
                    ),
                    child: TextField(
                      autofocus: true,
                      onChanged: ((value) {
                        context.read<SearchBloc>().add(SearchProductEvent(
                              productName: value,
                            ));
                      }),
                      decoration: InputDecoration(
                        hintText: AppStrings.searchForAProduct,
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
                          padding:
                              EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
                          child: Icon(
                            Icons.search,
                            size: FontSizeManager.s20.sp,
                          ),
                        ),
                      ),
                      cursorColor: ColorManager.primaryColor,
                    ),
                  ),
                  state.products.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.products.length,
                          itemBuilder: ((context, index) {
                            return SearchProductItem(
                              product: state.products[index],
                            );
                          }),
                        )
                      : const SizedBox(),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(AppStrings.someThingWentWrong),
            );
          }
        },
      ),
    );
  }
}

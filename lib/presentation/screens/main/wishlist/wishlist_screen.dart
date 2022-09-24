import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/business_logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/wishlist/widgets/wishlist_product_card.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          AppStrings.wishlist,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistSuccessState) {
            return state.wishlist.products.isEmpty
                ? const Center(
                    child: Text(AppStrings.yourWishlistIsEmpty),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.wishlist.products.length,
                      itemBuilder: ((context, index) {
                        return WishlistProductCard(
                          product: state.wishlist.products[index],
                        );
                      }),
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

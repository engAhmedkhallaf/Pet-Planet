import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/bussiness_logic/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/cart/widgets/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          AppStrings.cart,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartSuccessState) {
            return state.cart.products.isEmpty
                ? const Center(
                    child: Text(AppStrings.yourCartIsEmpty),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 7,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: ((context, index) {
                              return CartProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                              );
                            }),
                          ),
                        ),
                        Column(
                          children: [
                            const Divider(
                              thickness: AppSize.s2,
                              color: ColorManager.grey,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p20.w,
                                vertical: AppPadding.p10.h,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.subTotal,
                                        style: getApplicationTheme()
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: FontSizeManager.s18.sm,
                                              height: AppSize.s1,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '\$${state.cart.subTotalString}',
                                        style: getApplicationTheme()
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: ColorManager.grey,
                                              height: AppSize.s1,
                                              fontSize: FontSizeManager.s16.sm,
                                            ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: AppSize.s10.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppStrings.deliveryFee,
                                        style: getApplicationTheme()
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: FontSizeManager.s18.sm,
                                              height: AppSize.s1,
                                            ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        '\$${state.cart.deliveryFeeString}',
                                        style: getApplicationTheme()
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: ColorManager.grey,
                                              fontSize: FontSizeManager.s16.sm,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: AppSize.s40.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppPadding.p20.w),
                              // margin: EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
                              decoration: BoxDecoration(
                                color: ColorManager.backgroundColor
                                    .withOpacity(0.9),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.lightGrey,
                                    spreadRadius: AppSize.s1.r,
                                    blurRadius: AppSize.s1.r,
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppStrings.total,
                                    style: getApplicationTheme()
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: FontSizeManager.s18.sm,
                                          height: AppSize.s1,
                                        ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    '\$${state.cart.totalString}',
                                    style: getApplicationTheme()
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                          color: ColorManager.grey,
                                          height: 1.0,
                                          fontSize: FontSizeManager.s16.sm,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s8.h,
                            ),
                            Container(
                              height: AppSize.s40.h,
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: AppMargin.m6.h),
                              padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p80.w,
                                vertical: AppPadding.p5.h,
                              ),
                              decoration: BoxDecoration(
                                  color: ColorManager.transparent,
                                  // color: ColorManager.backgroundColor.withOpacity(0.85),
                                  borderRadius: BorderRadius.circular(5)),
                              child: ElevatedButton(
                                onPressed: () {
                                  navigateTo(context, Routes.checkRoute);
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.white,
                                  foregroundColor: ColorManager.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s5),
                                  ),
                                  maximumSize:
                                      Size(AppSize.s100.w, AppSize.s30.h),
                                  minimumSize:
                                      Size(AppSize.s80.w, AppSize.s15.h),
                                ),
                                child: Text(
                                  AppStrings.goToWishlist,
                                  style: getApplicationTheme()
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: ColorManager.black,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
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

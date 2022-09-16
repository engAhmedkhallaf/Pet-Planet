import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/product_model.dart';
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
      body: Padding(
        padding: EdgeInsets.all(AppPadding.p12.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CartProductCard(
                  product: Product.productList[0],
                ),
                CartProductCard(
                  product: Product.productList[1],
                ),
                CartProductCard(
                  product: Product.productList[0],
                ),
              ],
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
                    vertical: AppPadding.p10.w,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.subTotal,
                            style: getApplicationTheme()
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: FontSizeManager.s18.sp,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$200.0', //TODO: update sub total price
                            style: getApplicationTheme()
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ColorManager.grey,
                                  height: 1.0,
                                  fontSize: FontSizeManager.s16.sp,
                                ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s10.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppStrings.deliveryFee,
                            style: getApplicationTheme()
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: FontSizeManager.s18.sp,
                                ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            '\$200.0', //TODO: update delivery fee
                            style: getApplicationTheme()
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: ColorManager.grey,
                                  height: 1.0,
                                  fontSize: FontSizeManager.s16.sp,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: AppSize.s60.w,
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
                  // margin: EdgeInsets.symmetric(horizontal: AppPadding.p5.w),
                  decoration: BoxDecoration(
                    color: ColorManager.backgroundColor.withOpacity(0.9),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.lightGrey,
                        spreadRadius: AppSize.s1.r,
                        blurRadius: AppSize.s1.r,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.total,
                        style: getApplicationTheme()
                            .textTheme
                            .titleLarge!
                            .copyWith(
                              fontSize: FontSizeManager.s18.sp,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$200.0', //TODO: update total price
                        style: getApplicationTheme()
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: ColorManager.grey,
                              height: 1.0,
                              fontSize: FontSizeManager.s16.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: AppSize.s10,
                ),
                Container(
                  height: AppSize.s60.w,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p80.w,
                    vertical: AppPadding.p10.w,
                  ),
                  decoration: BoxDecoration(
                      color: ColorManager.backgroundColor.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                    onPressed: () {
                      navigateTo(context, Routes.checkRoute);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.white,
                      foregroundColor: ColorManager.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s5),
                      ),
                      maximumSize: Size(AppSize.s100.w, AppSize.s40.w),
                      minimumSize: Size(AppSize.s80.w, AppSize.s20.w),
                    ),
                    child: const Text(AppStrings.goToWishlist),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

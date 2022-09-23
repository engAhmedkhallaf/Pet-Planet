import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/business_logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartSuccessState) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p2.w),
            child: Column(
              children: [
                const Divider(
                  thickness: AppSize.s2,
                  color: ColorManager.grey,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p2.w,
                    vertical: AppPadding.p10.h,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  height: AppSize.s40.sm,
                  padding: EdgeInsets.symmetric(
                    horizontal: AppPadding.p20.w,
                  ),
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
              ],
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/bussiness_logic/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class CartProductCard extends StatelessWidget {
  const CartProductCard({
    super.key,
    required this.product,
    required this.quantity,
  });
  final Product product;
  final int quantity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Dismissible(
          key: Key(product.name),
          onDismissed: ((direction) {
            if (state is CartSuccessState) {
              context.read<CartBloc>().add(RemoveProductFromCartEvent(product));

              const snackBar = SnackBar(
                content: Text(AppStrings.removedFromYourCart),
                duration: AppDuration.d500,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: AppMargin.m6.w),
            decoration: BoxDecoration(
              color: ColorManager.backgroundColor.withOpacity(0.85),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.grey,
                  // spreadRadius: AppSize.s1.r,
                  blurRadius: AppSize.s1.r,
                ),
              ],
            ),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: product.imageUrl,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Image.asset(
                    AssetsManager.noImage,
                    fit: BoxFit.cover,
                  ),
                  fit: BoxFit.cover,
                  width: AppSize.s100.w,
                  height: AppSize.s100.w,
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: getApplicationTheme()
                            .textTheme
                            .titleLarge!
                            .copyWith(
                              fontSize: FontSizeManager.s20.sp,
                              height: AppSize.s1_5,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${product.price}',
                        style: getApplicationTheme()
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: ColorManager.grey,
                              height: AppSize.s1_5,
                              fontSize: FontSizeManager.s14.sp,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: AppSize.s10.w,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (state is CartSuccessState) {
                            context
                                .read<CartBloc>()
                                .add(RemoveProductFromCartEvent(product));
                            if (quantity > 1) {
                              const snackBar = SnackBar(
                                content: Text(
                                  AppStrings.yourProductIsDecreasedByOne,
                                ),
                                duration: AppDuration.d500,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              const snackBar = SnackBar(
                                content: Text(
                                  AppStrings.removedFromYourCart,
                                ),
                                duration: AppDuration.d500,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        icon: Icon(
                          Icons.remove_circle,
                          size: FontSizeManager.s25.sp,
                          color: ColorManager.lightGrey,
                        ),
                      ),
                      Text(
                        '$quantity',
                        style: getApplicationTheme()
                            .textTheme
                            .titleLarge!
                            .copyWith(
                              fontSize: FontSizeManager.s20.sp,
                              color: ColorManager.lightGrey,
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (state is CartSuccessState) {
                            context
                                .read<CartBloc>()
                                .add(AddProductToCartEvent(product));
                            const snackBar = SnackBar(
                              content: Text(
                                AppStrings.yourProductIsIncreasedByOne,
                              ),
                              duration: AppDuration.d500,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
                        },
                        icon: Icon(
                          Icons.add_circle,
                          size: FontSizeManager.s25.sp,
                          color: ColorManager.lightGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

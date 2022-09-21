import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/business_logic/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/business_logic/wishlist_bloc/wishlist_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class WishlistProductCard extends StatelessWidget {
  const WishlistProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: AppMargin.m6.w),
      decoration: BoxDecoration(
        color: ColorManager.backgroundColor.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: AppSize.s1.r,
          ),
        ],
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            imageUrl: product.imageUrl,
            placeholder: (context, url) => const CircularProgressIndicator(),
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
                  style: getApplicationTheme().textTheme.titleLarge!.copyWith(
                        fontSize: FontSizeManager.s20.sp,
                        height: AppSize.s1_5,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product.price}',
                  style: getApplicationTheme().textTheme.titleMedium!.copyWith(
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
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        if (state is CartSuccessState) {
                          context
                              .read<CartBloc>()
                              .add(AddProductToCartEvent(product));
                          const snackBar = SnackBar(
                            content: Text(
                              AppStrings.addedToYourCart,
                              textAlign: TextAlign.center,
                            ),
                            duration: AppDuration.d500,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      icon: Icon(
                        Icons.add_circle,
                        size: FontSizeManager.s25.sp,
                        color: ColorManager.lightGrey,
                      ),
                    );
                  },
                ),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                      onPressed: () {
                        if (state is WishlistSuccessState) {
                          context
                              .read<WishlistBloc>()
                              .add(RemoveProductFromWishlistEvent(product));
                          const snackBar = SnackBar(
                            content: Text(
                              AppStrings.removedFromYourWishlist,
                              textAlign: TextAlign.center,
                            ),
                            duration: AppDuration.d500,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      icon: Icon(
                        Icons.delete,
                        size: FontSizeManager.s25.sp,
                        color: ColorManager.lightGrey,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

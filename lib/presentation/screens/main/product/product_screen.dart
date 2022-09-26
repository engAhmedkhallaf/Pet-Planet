import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/business_logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/business_logic/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: CustomAppBarWithWishlist(title: product.name),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s220.w,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Image.asset(
                  AssetsManager.noImage,
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: AppSize.s20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p8.w),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: AppSize.s60.w,
                    alignment: Alignment.center,
                    color: ColorManager.lightGrey,
                    child: Container(
                      width: MediaQuery.of(context).size.width - 10,
                      height: AppSize.s50.w,
                      margin: EdgeInsets.all(AppPadding.p4.w),
                      color: ColorManager.backgroundColor.withOpacity(0.9),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: getApplicationTheme()
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: FontSizeManager.s18.sp,
                                  height: AppSize.s1,
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
                                  height: 1.0,
                                  fontSize: FontSizeManager.s16.sp,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: AppSize.s10.h,
            ),
            ExpansionTile(
              initiallyExpanded: true,
              title: Text(
                AppStrings.aboutProduct,
                style: getApplicationTheme().textTheme.headlineSmall,
              ),
              iconColor: ColorManager.grey,
              collapsedIconColor: ColorManager.grey,
              children: [
                ListTile(
                  title: Text(
                    product.description,
                    style: getApplicationTheme().textTheme.bodyMedium!.copyWith(
                          color: ColorManager.lightGrey,
                        ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorManager.backgroundColor,
        child: SizedBox(
          height: AppSize.s70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    onPressed: () {
                      if (state is WishlistSuccessState) {
                        context
                            .read<WishlistBloc>()
                            .add(AddProductToWishlistEvent(product));
                        const snackBar = SnackBar(
                          content: Text(
                            AppStrings.addedToYourWishlist,
                            textAlign: TextAlign.center,
                          ),
                          duration: AppDuration.d500,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: ColorManager.white,
                      size: AppSize.s25.sm,
                    ),
                    tooltip: AppStrings.addToWishlist,
                  );
                },
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () {
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.white,
                      foregroundColor: ColorManager.backgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s5),
                      ),
                      maximumSize: Size(AppSize.s170.w, AppSize.s50.w),
                      minimumSize: Size(AppSize.s120.w, AppSize.s30.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          AppStrings.addToCart,
                        ),
                        Icon(
                          IconBroken.cart,
                          color: ColorManager.backgroundColor,
                          size: AppSize.s25.sm,
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
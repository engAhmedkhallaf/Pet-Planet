import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

//TODO: ظبط ال colors
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigateToWithArguments(
          context,
          Routes.productRoute,
          product,
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: AppMargin.m12.w),
        height: AppSize.s220.h,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: ColorManager.backgroundColor.withRed(20),
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
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
                Text(
                  product.name,
                  style: getApplicationTheme().textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '\$${product.price}',
                  style: getApplicationTheme().textTheme.titleMedium!.copyWith(
                        color: ColorManager.grey,
                        height: 1.0,
                      ),
                ),
              ],
            ),
            Positioned(
              right: AppPadding.p8.w,
              top: AppPadding.p8.w,
              child: CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
                radius: AppSize.s15.r,
                child: IconButton(
                  onPressed: () {
                    //TODO: Add to CART
                  },
                  tooltip: AppStrings.addToCart,
                  icon: Image.asset(
                    AssetsManager.plus,
                    color: ColorManager.white,
                    height: AppSize.s15.w,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// لو الصور متفرغه 
/*
Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
        color: ColorManager.backgroundColor.withOpacity(0.85),
        boxShadow: [
          BoxShadow(
            color: ColorManager.grey,
            blurRadius: AppSize.s5.r,
            offset: const Offset(AppSize.s5, AppSize.s5),
          ),
        ],
        borderRadius: BorderRadius.circular(AppSize.s30.r),
        border: Border.all(
          color: ColorManager.primaryColor,
          width: AppSize.s2,
        ),
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p50),
            decoration: BoxDecoration(
              color: ColorManager.backgroundColor.withOpacity(0.85),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.grey,
                  blurRadius: AppSize.s10.r,
                  // offset: const Offset(AppSize.s5, AppSize.s5),
                ),
              ],
              borderRadius: BorderRadius.circular(AppSize.s25.r),
              // image: DecorationImage(
              //   image: (product.imageUrl.isEmpty)
              //       ? const AssetImage(AssetsManager.noImage)
              //       : CachedNetworkImageProvider(
              //           product.imageUrl,
              //           /* TODO:Add imageUrl of category */
              //         ) as ImageProvider,
              //   fit: BoxFit.none,
              // ),
              image: const DecorationImage(
                image: AssetImage('assets/icons/palm-trees.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            right: AppPadding.p8.w,
            top: AppPadding.p8.w,
            child: InkWell(
              onTap: () {},
              child: CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
                radius: AppSize.s20.r,
                child: Image.asset(
                  AssetsManager.plus,
                  color: ColorManager.white,
                  height: AppSize.s15.w,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: AppPadding.p5.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    product.name,
                    style:
                        getApplicationTheme().textTheme.displayLarge!.copyWith(
                              color: ColorManager.lightGrey,
                              fontSize: FontSizeManager.s25.sp,
                              height: 1.0,
                            ),
                  ),
                  Text(
                    '\$${product.price.toString()}',
                    style:
                        getApplicationTheme().textTheme.headlineSmall!.copyWith(
                              color: ColorManager.grey,
                              fontSize: FontSizeManager.s20.sp,
                              height: 1.0,
                            ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
 */
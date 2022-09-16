import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
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
      // appBar: CustomAppBarWithWishlist(title: ''),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s250.w,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                fit: StackFit.expand,
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
                  ),
                  Positioned(
                    top: AppPadding.p60.w,
                    left: AppPadding.p12.w,
                    right: AppPadding.p12.w,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: AppSize.s20.w.r,
                            backgroundColor: ColorManager.primaryColor,
                            child: IconButton(
                              onPressed: () {
                                navigateBack(context);
                              },
                              tooltip: AppStrings.back,
                              splashColor: ColorManager.primaryColor,
                              icon: Icon(
                                IconBroken.Arrow___Left_2,
                                color: ColorManager.white,
                                size: AppSize.s25.w.r,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            radius: AppSize.s20.w.r,
                            backgroundColor: ColorManager.primaryColor,
                            child: IconButton(
                              onPressed: () {
                                //TODO: add to wishlist
                              },
                              tooltip: AppStrings.addToWishlist,
                              splashColor: ColorManager.primaryColor,
                              icon: Icon(
                                IconBroken.Heart,
                                color: ColorManager.white,
                                size: AppSize.s25.w.r,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              product.name,
              style: getApplicationTheme().textTheme.displayLarge!.copyWith(
                  color: ColorManager.lightGrey,
                  fontSize: FontSizeManager.s50.sp),
            ),
            Text(product.description),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: ColorManager.lightGrey,
        child: Container(
          height: AppSize.s70,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'QTY:',
                  style: getApplicationTheme().textTheme.bodyLarge!.copyWith(
                        fontSize: FontSizeManager.s20.sp,
                      ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: (
                      //TODO: Add to Cart
                      ) {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(AppStrings.addToCart),
                      Icon(IconBroken.Cart)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

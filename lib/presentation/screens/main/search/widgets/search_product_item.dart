import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class SearchProductItem extends StatelessWidget {
  const SearchProductItem({super.key, required this.product});
  final Product product;
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
      splashColor: ColorManager.primaryColor,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: AppMargin.m6.w,
          horizontal: AppMargin.m10.w,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p5,
          vertical: AppPadding.p2,
        ),
        decoration: BoxDecoration(
            color: ColorManager.backgroundColor.withOpacity(0.85),
            boxShadow: [
              BoxShadow(
                color: ColorManager.grey,
                blurRadius: AppSize.s1.r,
              ),
            ],
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: [
            SizedBox(
              width: AppSize.s25.w,
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
                    product.price.toString(),
                    style: getApplicationTheme().textTheme.titleLarge!.copyWith(
                          fontSize: FontSizeManager.s12.sp,
                          height: AppSize.s1_5,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            CircleAvatar(
              radius: AppSize.s32.w,
              backgroundImage: CachedNetworkImageProvider(product.imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}

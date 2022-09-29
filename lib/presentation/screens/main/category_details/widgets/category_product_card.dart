import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/business_logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class CategoryProductCard extends StatelessWidget {
  const CategoryProductCard({super.key, required this.product});
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
      child: Container(
        margin: EdgeInsets.only(bottom: AppMargin.m12.w),
        height: AppSize.s220.h,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          color: ColorManager.backgroundColor.withOpacity(0.59),
          borderRadius: BorderRadius.circular(AppSize.s10.r),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: CachedNetworkImage(
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'EGP ',
                      style:
                          getApplicationTheme().textTheme.titleMedium!.copyWith(
                                color: ColorManager.grey,
                                height: 1.0,
                              ),
                    ),
                    Text(
                      '${product.price}',
                      style:
                          getApplicationTheme().textTheme.titleMedium!.copyWith(
                                color: ColorManager.grey,
                                height: 1.0,
                              ),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: AppPadding.p8.w,
              top: AppPadding.p8.w,
              child: CircleAvatar(
                backgroundColor: ColorManager.primaryColor,
                radius: AppSize.s15.r,
                child: BlocBuilder<CartBloc, CartState>(
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
                      tooltip: AppStrings.addToCart,
                      icon: Image.asset(
                        AssetsManager.plus,
                        color: ColorManager.white,
                        height: AppSize.s15.w,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

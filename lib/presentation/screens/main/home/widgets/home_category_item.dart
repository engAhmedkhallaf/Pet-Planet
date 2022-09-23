import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/business_logic/blocs/Product_bloc/product_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/data/models/category_model.dart';

class HomeCategoryItem extends StatelessWidget {
  const HomeCategoryItem({super.key, required this.categoryModel});
  final Category categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.s90.w,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppPadding.p20.w,
        vertical: AppPadding.p8.h,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppPadding.p55.w,
            ),
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p20.w),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s50),
                bottomLeft: Radius.circular(AppSize.s50),
                topRight: Radius.circular(AppSize.s8),
                bottomRight: Radius.circular(AppSize.s8),
              ),
              color: ColorManager.backgroundColor,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.grey,
                  spreadRadius: AppSize.s2.r,
                  blurRadius: AppSize.s1.r,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryModel.name,
                  style: getApplicationTheme().textTheme.displayLarge!.copyWith(
                        fontSize: FontSizeManager.s22.sp,
                        height: AppSize.s1.w,
                        color: ColorManager.lightGrey,
                      ),
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  bloc: context.read<ProductBloc>(),
                  builder: (context, state) {
                    if (state is ProductLoadedState) {
                      return Text(
                        '${state.products.where((element) => (element.category == categoryModel.name)).toList().length} Items',
                        style: getApplicationTheme()
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              fontSize: FontSizeManager.s12.sp,
                              height: AppSize.s1.w,
                            ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: AppSize.s65.w,
              height: AppSize.s65.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: (categoryModel.imageUrl.isEmpty)
                      ? const AssetImage(AssetsManager.noImage)
                      : CachedNetworkImageProvider(
                          categoryModel.imageUrl,
                        ) as ImageProvider,
                  fit: BoxFit.cover,
                ),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.grey,
                    blurRadius: AppSize.s6.r,
                    spreadRadius: AppSize.s1.r,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: AppSize.s30.w,
              height: AppSize.s30.w,
              decoration: BoxDecoration(
                color: ColorManager.lightGrey,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.grey,
                    blurRadius: AppSize.s6.w,
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  // IconBroken.Arrow___Right_2,
                  Icons.arrow_forward_ios_outlined,
                  color: ColorManager.primaryColor,
                  size: AppSize.s18.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

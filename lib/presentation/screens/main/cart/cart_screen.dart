import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/user_model.dart';
import 'package:pet_planet/presentation/business_logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/order_summary.dart';
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
      backgroundColor: ColorManager.backgroundColor.withOpacity(0.59),
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CartSuccessState) {
            return state.cart.products.isEmpty
                ? const Center(
                    child: Text(AppStrings.yourCartIsEmpty),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: AppPadding.p12.w),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .length,
                            itemBuilder: ((context, index) {
                              return CartProductCard(
                                product: state.cart
                                    .productQuantity(state.cart.products)
                                    .keys
                                    .elementAt(index),
                                quantity: state.cart
                                    .productQuantity(state.cart.products)
                                    .values
                                    .elementAt(index),
                              );
                            }),
                          ),
                        ),
                        Column(
                          children: [
                            const OrderSummary(),
                            SizedBox(
                              height: AppSize.s12.sm,
                            ),
                            SizedBox(
                              height: AppSize.s40.sm,
                              child: ElevatedButton(
                                onPressed: () {
                                  navigateToWithArguments(
                                    context,
                                    Routes.checkoutRoute,
                                    {UserModel},
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorManager.white,
                                  foregroundColor: ColorManager.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(AppSize.s5),
                                  ),
                                ),
                                child: Text(
                                  AppStrings.goToWishlist,
                                  style: getApplicationTheme()
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                        color: ColorManager.black,
                                        fontSize: FontSizeManager.s18.sm,
                                      ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s8,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
          } else {
            return const Center(
              child: Text(AppStrings.someThingWentWrong),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/business_logic/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:pet_planet/presentation/business_logic/cubits/main_cubit/main_cubit.dart';
import 'package:pet_planet/presentation/common/widgets/order_summary.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppStrings.orderConfirmation,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.backgroundColor,
        elevation: 0.0,
      ),
      body: Container(
        // height: 300,
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p12.w,
        ),
        width: double.infinity,
        color: ColorManager.backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: AppSize.s5.w,
            ),
            Column(
              children: [
                SvgPicture.asset(
                  AssetsManager.orderSuccess,
                  color: ColorManager.lightGrey,
                  width: AppSize.s100.w,
                ),
                SizedBox(
                  height: AppSize.s15.w,
                ),
                Text(
                  AppStrings.thankYou,
                  style: getApplicationTheme().textTheme.displaySmall!.copyWith(
                        color: ColorManager.lightGrey,
                      ),
                ),
                Text(
                  AppStrings.yourOrderIsBeingProcessing,
                  style:
                      getApplicationTheme().textTheme.headlineSmall!.copyWith(
                            color: ColorManager.lightGrey,
                            fontSize: FontSizeManager.s17.sp,
                          ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(
              height: AppSize.s25.w,
            ),
            // const OrderSummary(),
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CheckoutSuccessState) {
            return BottomAppBar(
              color: ColorManager.backgroundColor,
              child: SizedBox(
                height: AppSize.s70.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<MainCubit>(context).currentIndex = 0;
                        navigateAndRemove(context, Routes.mainLayoutRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.lightGrey,
                        foregroundColor: ColorManager.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s5),
                        ),
                        maximumSize: Size(AppSize.s220.w, AppSize.s50.w),
                        minimumSize: Size(AppSize.s200.w, AppSize.s30.w),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20,
                        ),
                        child: Text(
                          AppStrings.backToShopping,
                          style: getApplicationTheme()
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                fontSize: FontSizeManager.s16.sp,
                                color: ColorManager.black,
                              ),
                        ),
                      ),
                    )
                  ],
                ),
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

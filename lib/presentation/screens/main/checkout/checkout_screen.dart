import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/business_logic/blocs/checkout_bloc/checkout_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/common/widgets/order_summary.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: CustomAppBarWithWishlist(title: AppStrings.checkout),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: SingleChildScrollView(
          child: BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CheckoutSuccessState) {
            //  UserModel  userModel ;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p10),
                      child: Text(
                        AppStrings.customerInformation,
                        style: getApplicationTheme()
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              fontWeight: FontWeightManager.bold,
                              color: ColorManager.lightGrey,
                            ),
                      ),
                    ),
                    _buildTextFormField(
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckoutEvent(
                                user: state.checkout.user!.copyWith(
                                  displayName: value,
                                ),
                              ),
                            );
                      },
                      context: context,
                      labelText: AppStrings.fullName,
                      initialValue:' userModel.displayName',
                      textInputType: TextInputType.name,
                    ),
                    _buildTextFormField(
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckoutEvent(
                                user: state.checkout.user!.copyWith(
                                  email: value,
                                ),
                              ),
                            );
                      },
                      context: context,
                      labelText: AppStrings.email,
                      textInputType: TextInputType.emailAddress,
                    ),
                    _buildTextFormField(
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckoutEvent(
                                user: state.checkout.user!.copyWith(
                                  phoneNumber: value,
                                ),
                              ),
                            );
                      },
                      initialValue: 'userModel.displayName',
                      context: context,
                      labelText: AppStrings.mobileNumber,
                      textInputType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: AppSize.s20.w,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppPadding.p10),
                      child: Text(
                        AppStrings.deliveryInformation,
                        style: getApplicationTheme()
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              fontWeight: FontWeightManager.bold,
                              color: ColorManager.lightGrey,
                            ),
                      ),
                    ),
                    _buildTextFormField(
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckoutEvent(
                                user: state.checkout.user!.copyWith(
                                  address: value,
                                ),
                              ),
                            );
                      },
                      context: context,
                      labelText: AppStrings.address,
                      textInputType: TextInputType.streetAddress,
                    ),
                    _buildTextFormField(
                      onChanged: (value) {
                        context.read<CheckoutBloc>().add(
                              UpdateCheckoutEvent(
                                user: state.checkout.user!.copyWith(
                                  address: value,
                                ),
                              ),
                            );
                      },
                      context: context,
                      labelText: AppStrings.city,
                      textInputType: TextInputType.text,
                    ),
                    SizedBox(
                      height: AppSize.s20.w,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: AppPadding.p10),
                      child: Text(
                        AppStrings.orderSummary,
                        style: getApplicationTheme()
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                              fontWeight: FontWeightManager.bold,
                              color: ColorManager.lightGrey,
                            ),
                      ),
                    ),
                    const OrderSummary(),
                  ],
                );
              } else {
                return const Center(
                  child: Text(AppStrings.someThingWentWrong),
                );
              }
            },
          ),
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
                height: AppSize.s70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<CheckoutBloc>().add(
                              ConfirmCheckoutEvent(
                                checkout: state.checkout,
                              ),
                            );
                        navigateTo(
                          context,
                          Routes.orderConfirmationRoute,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.lightGrey,
                        foregroundColor: ColorManager.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppSize.s5),
                        ),
                        maximumSize: Size(AppSize.s170.w, AppSize.s50.w),
                        minimumSize: Size(AppSize.s120.w, AppSize.s30.w),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20,
                        ),
                        child: Text(
                          AppStrings.orderNow,
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

  Padding _buildTextFormField({
    required Function(String)? onChanged,
    required BuildContext context,
    required String labelText,
    String? initialValue,
    TextInputType? textInputType,
  }) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Row(
        children: [
          SizedBox(
            width: AppSize.s90.w,
            child: Text(
              labelText,
              style: getApplicationTheme().textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                  left: AppPadding.p5.w,
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.grey,
                  ),
                ),
                filled: false,
                hintStyle: null,
                labelStyle: null,
                errorStyle: null,
                suffixIconColor: null,
                suffixStyle: null,
                prefixIconColor: null,
                prefixStyle: null,
                disabledBorder: null,
                errorBorder: null,
                focusedErrorBorder: null,
                border: null,
              ),
              initialValue: initialValue,
              cursorColor: ColorManager.primaryColor,
              keyboardType: textInputType,
            ),
          ),
        ],
      ),
    );
  }
}

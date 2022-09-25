import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/presentation/common/widgets/custom_snack_bar.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/styles/style_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/presentation/business_logic/blocs/profile_bloc/profile_bloc.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_image.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white.withOpacity(0.05),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            navigateBack(context);
          },
          splashColor: ColorManager.primaryColor,
          tooltip: AppStrings.back,
          icon: Icon(
            IconBroken.arrowleft_2,
            color: ColorManager.grey,
            size: AppSize.s25.w,
          ),
        ),
        centerTitle: true,
        title: Text(
          AppStrings.editProfile,
          style: getBoldStyle(
            color: ColorManager.grey,
            fontSize: FontSizeManager.s20.sp,
          ).copyWith(letterSpacing: FontSizeManager.s1.w),
        ),
        backgroundColor: ColorManager.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoadedState) {
            TextEditingController displayNameController =
                TextEditingController(text: state.user.displayName);
            TextEditingController emailController =
                TextEditingController(text: state.user.email);
            TextEditingController phoneNumberController =
                TextEditingController(text: state.user.phoneNumber);
            TextEditingController addressController =
                TextEditingController(text: state.user.address);

            return SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: EdgeInsets.only(
                  left: AppPadding.p16.w,
                  right: AppPadding.p16.w,
                  top: AppPadding.p20.w,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                ProfileImage(
                                  photoUrl: state.user.photoUrl,
                                  radius_1: AppSize.s60.w,
                                  radius_2: AppSize.s59.w,
                                ),
                                SizedBox(
                                  height: AppSize.s15.w,
                                ),
                                Text(
                                  'Hi, ${(state.user.displayName).split(' ')[0]}!',
                                  style: getApplicationTheme()
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(
                                        color: ColorManager.grey,
                                        fontSize: FontSizeManager.s22.sp,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: AppSize.s40.w,
                        ),
                        _buildTextFormField(
                          controller: displayNameController,
                          onEditingComplete: () {},
                          context: context,
                          labelText: AppStrings.fullName,
                          textInputType: TextInputType.name,
                        ),
                        SizedBox(
                          height: AppSize.s15.w,
                        ),
                        _buildTextFormField(
                          controller: emailController,
                          onEditingComplete: () {},
                          context: context,
                          labelText: AppStrings.email,
                          textInputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: AppSize.s15.w,
                        ),
                        _buildTextFormField(
                          controller: phoneNumberController,
                          onEditingComplete: () {},
                          context: context,
                          labelText: AppStrings.mobileNumber,
                          textInputType: TextInputType.number,
                        ),
                        SizedBox(
                          height: AppSize.s15.w,
                        ),
                        _buildTextFormField(
                          controller: addressController,
                          onEditingComplete: () {},
                          context: context,
                          labelText: AppStrings.address,
                          textInputType: TextInputType.streetAddress,
                        ),
                        SizedBox(
                          height: AppSize.s30.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 0.5.sw,
                              height: 40.0.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  context.read<ProfileBloc>().add(
                                        UpdateProfileEvent(
                                          user: state.user.copyWith(
                                            displayName:
                                                displayNameController.text,
                                            email: emailController.text
                                                .toLowerCase(),
                                            phoneNumber:
                                                phoneNumberController.text,
                                            address: addressController.text,
                                          ),
                                        ),
                                      );

                                  successSnackBar(
                                    context: context,
                                    message: AppStrings.dataSuccessfullySaved,
                                  );

                                  navigateBack(context);
                                },
                                style: getApplicationTheme()
                                    .elevatedButtonTheme
                                    .style!
                                    .copyWith(
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            AppSize.s25,
                                          ),
                                        ),
                                      ),
                                    ),
                                child: Text(
                                  AppStrings.save,
                                  style: TextStyle(
                                    color: ColorManager.lightGrey,
                                    fontSize: FontSizeManager.s16.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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

Padding _buildTextFormField({
  required void Function()? onEditingComplete,
  required TextEditingController? controller,
  required BuildContext context,
  required String labelText,
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
            style: getApplicationTheme().textTheme.bodyText1!.copyWith(
                  fontSize: FontSizeManager.s15.sp,
                  height: 2.0,
                ),
          ),
        ),
        Expanded(
          child: TextFormField(
            controller: controller,
            onEditingComplete: onEditingComplete,
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
            cursorColor: ColorManager.primaryColor,
            keyboardType: textInputType,
          ),
        ),
      ],
    ),
  );
}

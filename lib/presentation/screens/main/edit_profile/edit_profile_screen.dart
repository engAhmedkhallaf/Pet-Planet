import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            return Scaffold(
              backgroundColor: ColorManager.backgroundColor.withOpacity(0.59),
              body: SingleChildScrollView(
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
                                    'Hello, ${(state.user.displayName).split(' ')[0]}!',
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
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: state.user.copyWith(
                                        displayName: value,
                                      ),
                                    ),
                                  );
                            },
                            context: context,
                            labelText: AppStrings.fullName,
                            initialValue: state.user.displayName,
                            textInputType: TextInputType.name,
                          ),
                          SizedBox(
                            height: AppSize.s15.w,
                          ),
                          _buildTextFormField(
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: state.user.copyWith(
                                        email: value,
                                      ),
                                    ),
                                  );
                            },
                            context: context,
                            labelText: AppStrings.email,
                            initialValue: state.user.email,
                            textInputType: TextInputType.emailAddress,
                          ),
                          SizedBox(
                            height: AppSize.s15.w,
                          ),
                          _buildTextFormField(
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: state.user.copyWith(
                                        phoneNumber: value,
                                      ),
                                    ),
                                  );
                            },
                            context: context,
                            labelText: AppStrings.mobileNumber,
                            initialValue: state.user.phoneNumber,
                            textInputType: TextInputType.number,
                          ),
                          SizedBox(
                            height: AppSize.s15.w,
                          ),
                          _buildTextFormField(
                            onChanged: (value) {
                              context.read<ProfileBloc>().add(
                                    UpdateProfileEvent(
                                      user: state.user.copyWith(
                                        address: value,
                                      ),
                                    ),
                                  );
                            },
                            context: context,
                            labelText: AppStrings.address,
                            initialValue: state.user.address,
                            textInputType: TextInputType.number,
                          ),
                        ],
                      ),
                    ],
                  ),
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
            style: getApplicationTheme().textTheme.bodyText1!.copyWith(
                  fontSize: FontSizeManager.s15.sp,
                  height: 2.0,
                ),
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

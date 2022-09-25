import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/business_logic/blocs/profile_bloc/profile_bloc.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_icon_with_text.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_icon_with_text_button.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_image.dart';
import 'package:intl/intl.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProfileLoadedState) {
            return Scaffold(
              backgroundColor: ColorManager.backgroundColor.withOpacity(0.59),
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: AppPadding.p16.w,
                      right: AppPadding.p16.w,
                      top: AppPadding.p50.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        ProfileImage(
                                          photoUrl: state.user.photoUrl,
                                        ),
                                        SizedBox(
                                          height: AppSize.s15.w,
                                        ),
                                        Text(
                                          state.user.displayName,
                                          style: getApplicationTheme()
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                color: ColorManager.grey,
                                                fontSize:
                                                    FontSizeManager.s25.sp,
                                              ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Positioned(
                                  right: AppSize.s0,
                                  top: AppSize.s0,
                                  child: IconButton(
                                    onPressed: () {
                                      navigateTo(
                                        context,
                                        Routes.editProfileRoute,
                                      );
                                    },
                                    icon: Icon(
                                      IconBroken.edit,
                                      size: FontSizeManager.s25.sp,
                                      color: ColorManager.primaryColor,
                                    ),
                                    tooltip: AppStrings.editProfile,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s20.w,
                            ),
                            ProfileIconWithText(
                              icon: IconBroken.call,
                              text: state.user.phoneNumber,
                            ),
                            ProfileIconWithText(
                              icon: IconBroken.message,
                              text: state.user.email,
                            ),
                            ProfileIconWithText(
                              icon: IconBroken.location,
                              text: state.user.address,
                            ),
                            ProfileIconWithText(
                              icon: IconBroken.timeCircle,
                              text:
                                  'Joined at: ${DateFormat('dd-MM-yyyy').format(state.user.createdAt!)}',
                            ),
                            SizedBox(
                              height: AppSize.s10.w,
                            ),
                            const Divider(
                              color: ColorManager.grey,
                            ),
                            SizedBox(
                              height: AppSize.s10.w,
                            ),
                            ProfileIconWithTextButton(
                              onTap: () {
                                navigateTo(
                                  context,
                                  Routes.searchRoute,
                                );
                              },
                              text: AppStrings.search,
                              icon: IconBroken.search,
                            ),
                            SizedBox(
                              height: AppSize.s10.w,
                            ),
                            ProfileIconWithTextButton(
                              onTap: () {
                                navigateTo(
                                  context,
                                  Routes.editProfileRoute,
                                );
                              },
                              text: AppStrings.editProfile,
                              icon: IconBroken.editSquare,
                            ),
                            SizedBox(
                              height: AppSize.s10.w,
                            ),
                            ProfileIconWithTextButton(
                              onTap: () {
                                navigateTo(
                                  context,
                                  Routes.wishlistRoute,
                                );
                              },
                              text: AppStrings.yourWishlist,
                              icon: IconBroken.heart,
                            ),
                            const Divider(
                              color: ColorManager.grey,
                            ),
                            SizedBox(
                              height: AppSize.s10.w,
                            ),
                            ProfileIconWithTextButton(
                              onTap: () async {
                                await context.read<ProfileBloc>().logout();
                                CacheHelper.clearData();

                                // ignore: use_build_context_synchronously
                                navigateAndRemove(
                                  context,
                                  Routes.authLayoutRoute,
                                );
                              },
                              text: AppStrings.logout,
                              icon: IconBroken.logout,
                              color: ColorManager.mainColorSwatch.shade500,
                            ),
                          ],
                        ),
                      ],
                    ),
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

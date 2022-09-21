import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/user_model.dart';
import 'package:pet_planet/presentation/business_logic/user_cubit/user_cubit.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';
import 'package:pet_planet/presentation/resources/fonts/font_manager.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_icon_with_text.dart';
import 'package:pet_planet/presentation/screens/main/profile/widgets/profile_image.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserSuccessState) {
            return Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p10),
                      height: AppSize.s250.w,
                      width: double.infinity,
                      color: ColorManager.backgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    ProfileImage(
                                      photoUrl: state.user.photoUrl,
                                    ),
                                    SizedBox(
                                      width: AppSize.s20.w,
                                    ),
                                    Text(
                                      state.user.displayName,
                                      style: getApplicationTheme()
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                            color: ColorManager.grey,
                                            fontSize: FontSizeManager.s22.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  // TODO: navigate to edit profile
                                },
                                icon: Icon(IconBroken.Edit,
                                    size: FontSizeManager.s20.sp,
                                    color: ColorManager.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSize.s25.w,
                          ),
                          ProfileIconWithText(
                            icon: IconBroken.Call,
                            text: state.user.phoneNumber,
                          ),
                          ProfileIconWithText(
                            icon: IconBroken.Message,
                            text: state.user.email,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(50.0),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.signOut();
                            CacheHelper.removeData(key: 'uid');

                            // ignore: use_build_context_synchronously
                            navigateAndRemove(context, Routes.authLayoutRoute);
                          },
                          child: const Text('SIGN OUT'),
                        ),
                      ),
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

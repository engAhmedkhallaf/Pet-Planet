import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/presentation/business_logic/cubits/main_cubit/main_cubit.dart';
import 'package:pet_planet/presentation/resources/assets/assets_manager.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainCubit mainCubit = MainCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white10,
          body: mainCubit.mainScreens[mainCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: mainCubit.currentIndex,
            onTap: (index) {
              mainCubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                label: AppStrings.home,
                icon: Icon(IconBroken.Home),
                tooltip: AppStrings.home,
              ),
              BottomNavigationBarItem(
                label: AppStrings.cart,
                icon: Icon(IconBroken.Cart),
                tooltip: AppStrings.cart,
              ),
              BottomNavigationBarItem(
                label: AppStrings.profile,
                icon: Icon(IconBroken.Profile),
                tooltip: AppStrings.profile,
              ),
            ],
            // iconSize: AppSize.s25,
          ),
        );
      },
    );
  }
}

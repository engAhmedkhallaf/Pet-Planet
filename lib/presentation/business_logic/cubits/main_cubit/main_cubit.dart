import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/presentation/business_logic/cubits/user_cubit/user_cubit.dart';
import 'package:pet_planet/presentation/screens/main/cart/cart_screen.dart';
import 'package:pet_planet/presentation/screens/main/home/home.dart';
import 'package:pet_planet/presentation/screens/main/profile/profile_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> mainScreens = [
    const HomeScreen(),
    const CartScreen(),
    BlocProvider(
      create: (context) => UserCubit()..getUserData(),
      lazy: true,
      child: const ProfileScreen(),
    ),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}

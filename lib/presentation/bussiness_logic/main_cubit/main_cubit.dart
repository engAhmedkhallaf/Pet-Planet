import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/presentation/screens/main/cart/cart_screen.dart';
import 'package:pet_planet/presentation/screens/main/home/home.dart';
import 'package:pet_planet/presentation/screens/main/profile/profile.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> mainScreens = const [
    HomeScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    print(currentIndex);
    emit(ChangeBottomNavState());
  }
}

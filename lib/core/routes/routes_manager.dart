import 'package:flutter/material.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/screens/auth/auth_layout_screen.dart';
import 'package:pet_planet/presentation/screens/auth/forget_password/forgot_password_screen.dart';
import 'package:pet_planet/presentation/screens/auth/login/login_screen.dart';
import 'package:pet_planet/presentation/screens/auth/signup/signup_screen.dart';
import 'package:pet_planet/presentation/screens/home/home.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authLayoutRoute:
        return MaterialPageRoute(builder: (_) => const AuthLayoutScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) =>const SignUpScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) =>const ForgotPasswordScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>const HomeScreen());
      // case Routes.cartRoute:
      //   return MaterialPageRoute(builder: (_) => const CartView());
      // case Routes.deliveryLocationRoute:
      //   return MaterialPageRoute(builder: (_) => const DeliveryLocationView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(Routes.noRouteFound),
        ),
        body: const Center(
          child: Text(Routes.noRouteFound),
        ),
      ),
    );
  }
}

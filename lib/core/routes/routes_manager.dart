import 'package:flutter/material.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/screens/auth/auth_layout_screen.dart';
import 'package:pet_planet/presentation/screens/auth/forget_password/forgot_password_screen.dart';
import 'package:pet_planet/presentation/screens/auth/login/login_screen.dart';
import 'package:pet_planet/presentation/screens/auth/signup/signup_screen.dart';
import 'package:pet_planet/presentation/screens/main/cart/cart.dart';
import 'package:pet_planet/presentation/screens/main/category_details/category_details_screen.dart';
import 'package:pet_planet/presentation/screens/main/home/home.dart';
import 'package:pet_planet/data/models/category_model.dart';
import 'package:pet_planet/presentation/screens/main/main_layout.dart';
import 'package:pet_planet/presentation/screens/main/product/product_screen.dart';
import 'package:pet_planet/presentation/screens/main/profile/profile.dart';
import 'package:pet_planet/presentation/screens/main/wishlist/wishlist_screen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // Authintication
      case Routes.authLayoutRoute:
        return MaterialPageRoute(builder: (_) => const AuthLayoutScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      // Main
      case Routes.mainLayoutRoute:
        return MaterialPageRoute(builder: (_) => const MainLayout());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case Routes.profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case Routes.categoryDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => CategoryDetailsScreen(
            categoryModel: routeSettings.arguments as Category,
          ),
        );
      case Routes.productRoute:
        return MaterialPageRoute(
          builder: (_) => ProductScreen(
            product: routeSettings.arguments as Product,
          ),
        );
      case Routes.wishlistRoute:
        return MaterialPageRoute(builder: (_) => const WishlistScreen());

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

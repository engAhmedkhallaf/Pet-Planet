import 'package:flutter/material.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/screens/auth/auth_layout_screen.dart';




class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(
            builder: (_) =>const AuthLayoutScreen());
      // case Routes.layoutRoute:
      //   return MaterialPageRoute(builder: (_) => const LayoutView());
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
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(
                child: Text(AppStrings.noRouteFound),
              ),
            ),);
  }
}

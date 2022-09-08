import 'package:flutter/material.dart';

import '../../presentation/resources/strings_manager.dart';

class Routes {
  static const String authRoute = "authRoute";
  static const String layoutRoute = "layoutRoute";
  static const String deliveryLocationRoute = "deliveryLocationRoute";
  static const String cartRoute = "cartRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.authRoute:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Hello EVERYONE')),
                ));
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
            ));
  }
}

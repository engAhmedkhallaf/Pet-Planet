import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithWishlist(title: AppStrings.checkout),
       body:const Center(child: Text('YOUR CHECKOUT'),),);
  }
}

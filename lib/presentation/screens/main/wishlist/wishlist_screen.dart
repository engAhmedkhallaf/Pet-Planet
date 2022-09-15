import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithWishlist(title: 'WishList'),
    );
  }
}
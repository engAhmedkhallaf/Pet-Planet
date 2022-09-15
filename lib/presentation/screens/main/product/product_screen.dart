import 'package:flutter/material.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key, required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithWishlist(title: product.name),
    );
  }
}

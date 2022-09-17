import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/bussiness_logic/product_bloc/product_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/screens/main/category_details/widgets/category_product_card.dart';

import 'package:pet_planet/presentation/resources/values_manager.dart';
import 'package:pet_planet/data/models/category_model.dart';

class CategoryDetailsScreen extends StatelessWidget {
  const CategoryDetailsScreen({super.key, required this.categoryModel});

  final Category categoryModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: CustomAppBarWithWishlist(
        title: categoryModel.name,
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSuccessState) {
            final List<Product> categoryProducts = state.products
                .where((product) => (product.category == categoryModel.name))
                .toList();
            return GridView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12.w,
                vertical: AppPadding.p16.w,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .7,
                crossAxisSpacing: 10,
              ),
              itemCount: categoryProducts.length,
              itemBuilder: ((context, index) {
                return CategoryProductCard(
                  product: categoryProducts[index],
                );
              }),
            );
          } else {
            return const Center(
              child: Text(AppStrings.someThingWentWrong),
            );
          }
        },
      ),
    );
  }
}

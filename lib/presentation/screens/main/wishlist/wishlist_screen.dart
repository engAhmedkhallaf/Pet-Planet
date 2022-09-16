import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/data/models/product_model.dart';
import 'package:pet_planet/presentation/bussiness_logic/wishlist_bloc/wishlist_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/custom_appbar_with_wishlist.dart';
import 'package:pet_planet/presentation/common/widgets/product_card.dart';
import 'package:pet_planet/presentation/resources/strings_manager.dart';
import 'package:pet_planet/presentation/resources/values_manager.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWithWishlist(title: AppStrings.wishlist),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WishlistSuccessState) {
            print(state.wishlist.products);
            return state.wishlist.products.isEmpty
                ? const Center(
                    child: Text('Your Wishlist is Empty!'),
                  )
                : GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p12.w,
                      vertical: AppPadding.p16.w,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.4,
                    ),
                    itemCount: state.wishlist.products.length,
                    itemBuilder: ((context, index) {
                      return ProductCard(
                        product: state.wishlist.products[index],
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

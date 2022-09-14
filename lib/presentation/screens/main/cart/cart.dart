import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/resources/navigation/navigation.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Cart')),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  await CacheHelper.removeData(key: 'uid');

                  // ignore: use_build_context_synchronously
                  navigateAndRemove(context, Routes.authLayoutRoute);
                },
                child: const Text('SIGN OUT'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

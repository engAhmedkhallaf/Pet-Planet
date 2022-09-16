import 'package:flutter/material.dart';
import 'package:pet_planet/presentation/resources/colors/color_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Profile')),
    );
  }
}
/*
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
   */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_manager.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/bussiness_logic/app_cubit/app_cubit.dart';
import 'package:pet_planet/presentation/bussiness_logic/internet_cubit/internet_cubit.dart';
import 'package:pet_planet/presentation/bussiness_logic/signup_cubit/signup_cubit.dart';
import 'package:pet_planet/presentation/common/widgets/show_alert_dialog.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/screens/auth/auth_layout_screen.dart';
import 'package:pet_planet/presentation/screens/home/home.dart';

import 'app_constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit()..checkConnection(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => AppCubit(),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => SignupCubit(),
          lazy: false,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) {
          return MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            theme: getApplicationTheme(),
            onGenerateRoute: RouteGenerator.getRoute,
            // initialRoute: CacheHelper.get(key: AppConstants.uidKey) == null
            //     ? Routes.authLayoutRoute
            //     : Routes.homeRoute,

            // Use Home to make you able to show Alert to the whole tree of Material App
            home: BlocListener<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state is InternetDisConnectedState) {
                  showAlertDialog(
                    context,
                    state.message,
                    'Please check your internet',
                  );
                } else {}
              },
              child: CacheHelper.get(key: AppConstants.uidKey) == null
                  ? const AuthLayoutScreen()
                  : const HomeScreen(),
            ),
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}

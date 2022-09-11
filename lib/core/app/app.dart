import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/routes/routes_manager.dart';
import 'package:pet_planet/core/routes/routes_names.dart';
import 'package:pet_planet/presentation/bussiness_logic/app_cubit/app_cubit.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';

import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit(),
          lazy: false,
        ),
        // BlocProvider(
        //   create: (context) => di.instance<AuthCubit>(),
        //   lazy: false,
        // ),
        // BlocProvider(
        //   create: (context) => di.instance<CartCubit>(),
        //   lazy: false,
        // ),
        // BlocProvider(
        //   create: (context) => di.instance<HomeCubit>(),
        //   lazy: false,
        // ),
        // BlocProvider(
        //   create: (context) => di.instance<UserCubit>(),
        //   lazy: false,
        // ),
        // BlocProvider(
        //   create: (context) => di.instance<CategoriesCubit>(),
        //   lazy: false,
        // ),
        // BlocProvider(
        //   create: (context) => di.instance<NotificationCubit>(),
        //   lazy: false,
        // ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) => MaterialApp(
              navigatorKey: Constants.navigatorKey,
              theme: getApplicationTheme(),
              onGenerateRoute: RouteGenerator.getRoute,
              initialRoute: Routes.authLayoutRoute,
              debugShowCheckedModeBanner: false,
            )),
      ),
    );
  }
}

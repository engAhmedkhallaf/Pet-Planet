import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_planet/core/routes/routes_manager.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';

import 'constants.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
    // MultiBlocProvider(
    //   providers: [
        // BlocProvider(
        //   create: (context) => di.instance<UserCubit>(),
        //   lazy: false,
        // ),
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
      // ],
      // child:
       MaterialApp(
        navigatorKey: Constants.navigatorKey,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.authRoute,

        debugShowCheckedModeBanner: false,
        
        
      // ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/core/routes/routes_manager.dart';
import 'package:pet_planet/data/repositories/category/category_repository.dart';
import 'package:pet_planet/data/repositories/checkout/checkout_repository.dart';
import 'package:pet_planet/data/repositories/product/product_repository.dart';
import 'package:pet_planet/presentation/business_logic/cart_bloc/cart_bloc.dart';
import 'package:pet_planet/presentation/business_logic/category_bloc/category_bloc.dart';
import 'package:pet_planet/presentation/business_logic/checkout_bloc/checkout_bloc.dart';
import 'package:pet_planet/presentation/business_logic/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:pet_planet/presentation/business_logic/internet_cubit/internet_cubit.dart';
import 'package:pet_planet/presentation/business_logic/login_cubit/login_cubit.dart';
import 'package:pet_planet/presentation/business_logic/main_cubit/main_cubit.dart';
import 'package:pet_planet/presentation/business_logic/product_bloc/product_bloc.dart';
import 'package:pet_planet/presentation/business_logic/signup_cubit/signup_cubit.dart';
import 'package:pet_planet/presentation/business_logic/user_cubit/user_cubit.dart';
import 'package:pet_planet/presentation/business_logic/wishlist_bloc/wishlist_bloc.dart';
import 'package:pet_planet/presentation/common/widgets/show_alert_dialog.dart';
import 'package:pet_planet/presentation/resources/theme/theme_manager.dart';
import 'package:pet_planet/presentation/screens/auth/auth_layout_screen.dart';
import 'package:pet_planet/presentation/screens/main/main_layout.dart';

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
          create: (context) => SignupCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => ForgotPasswordCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => MainCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => UserCubit(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => CartBloc()
            ..add(
              CartStartedEvent(),
            ),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => WishlistBloc()
            ..add(
              WishlistStartedEvent(),
            ),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(
              StartCategoriesEvent(),
            ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              StartProductEvent(),
            ),
          lazy: false,
        ),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
          lazy: true,
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: ((context, child) {
          return MaterialApp(
            navigatorKey: AppConstants.navigatorKey,
            theme: getApplicationTheme(),
            onGenerateRoute: RouteGenerator.getRoute,

            // Use Home to make you able to show Alert to the whole tree of Material App
            home: BlocListener<InternetCubit, InternetState>(
              listener: (context, state) {
                if (state is InternetDisConnectedState) {
                  showAlertDialog(
                    context,
                    state.message,
                    'Please check your internet',
                  );
                } else {
                  // navigateBack(context);
                }
              },
              child: CacheHelper.get(key: AppConstants.uidKey) == null
                  ? const AuthLayoutScreen()
                  : const MainLayout(),
            ),
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}

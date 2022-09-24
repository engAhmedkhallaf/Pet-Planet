import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_planet/bloc_observer.dart';
import 'package:pet_planet/core/app/app.dart';
import 'package:pet_planet/core/network/local/cache_helper.dart';
import 'package:pet_planet/data/models/product_model.dart';

void main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Native Splash Screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Cache Helper initialize
  await CacheHelper.init();

  // firebase initialize
  await Firebase.initializeApp();

  // Hive Database initialize
  await Hive.initFlutter();
  Hive.registerAdapter(ProductAdapter());

  // bloc observer
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());

  // Remove Splash
  FlutterNativeSplash.remove();

  if (kReleaseMode) {
      debugPrint = (String? message, {int? wrapWidth}) {};
    }
}

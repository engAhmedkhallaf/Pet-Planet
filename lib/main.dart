import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:pet_planet/bloc_observer.dart';
import 'package:pet_planet/core/app/app.dart';

void main() async {
  // ensure initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Native Splash Screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // firebase initalize
  await Firebase.initializeApp();

  // bloc observer
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());

  // Remove Splash  
  FlutterNativeSplash.remove();
}

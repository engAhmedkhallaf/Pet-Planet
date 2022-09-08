import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit() : super(AuthInitialState()) {
    onReady();
  }

  
// Sign In 
  void signIn() async {   
  }

  onReady() {
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   if (user == null) {
    //     Constants.navigatorKey.currentState?.pushNamed(Routes.authRoute);
    //   } else {
    //     Constants.navigatorKey.currentState?.pushNamed(Routes.layoutRoute);
    //   }
    // });
  }
}

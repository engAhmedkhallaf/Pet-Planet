// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyC-khUAmiD-0IIJ4rjVyfAwwUx4aLQLoV4',
    appId: '1:912458352386:web:8b7a84b8e9edac4856e41b',
    messagingSenderId: '912458352386',
    projectId: 'petplanet-d7aa8',
    authDomain: 'petplanet-d7aa8.firebaseapp.com',
    storageBucket: 'petplanet-d7aa8.appspot.com',
    measurementId: 'G-879V8RHN88',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNQiJ0suyFa0efumCaS4Vl8r6GQrKkT1U',
    appId: '1:912458352386:android:0bd3a5d1fda03a8856e41b',
    messagingSenderId: '912458352386',
    projectId: 'petplanet-d7aa8',
    storageBucket: 'petplanet-d7aa8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARLVsxLXPYON93kOUW9fUQvjDtqg-4iME',
    appId: '1:912458352386:ios:9999be0a7b6d321656e41b',
    messagingSenderId: '912458352386',
    projectId: 'petplanet-d7aa8',
    storageBucket: 'petplanet-d7aa8.appspot.com',
    iosClientId: '912458352386-c3a063bqqstcruqq5jtkm9ptt5e80apb.apps.googleusercontent.com',
    iosBundleId: 'com.khalafawy.petsplanet',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARLVsxLXPYON93kOUW9fUQvjDtqg-4iME',
    appId: '1:912458352386:ios:9999be0a7b6d321656e41b',
    messagingSenderId: '912458352386',
    projectId: 'petplanet-d7aa8',
    storageBucket: 'petplanet-d7aa8.appspot.com',
    iosClientId: '912458352386-c3a063bqqstcruqq5jtkm9ptt5e80apb.apps.googleusercontent.com',
    iosBundleId: 'com.khalafawy.petsplanet',
  );
}

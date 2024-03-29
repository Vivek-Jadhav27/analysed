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
    apiKey: 'AIzaSyDBLKSjnlYT-MsbFu6y1fJ1mbxLkxX7aSo',
    appId: '1:213938927212:web:357898ddc7285b390dca49',
    messagingSenderId: '213938927212',
    projectId: 'myopia-11ddc',
    authDomain: 'myopia-11ddc.firebaseapp.com',
    storageBucket: 'myopia-11ddc.appspot.com',
    measurementId: 'G-FF3CFZ7LEM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyABnOVC4z7B5K4Andubw7Uw2BeoHQRaGLg',
    appId: '1:213938927212:android:6a192b29a2732ee90dca49',
    messagingSenderId: '213938927212',
    projectId: 'myopia-11ddc',
    storageBucket: 'myopia-11ddc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQrwnk31Orvb0rCaeAiWWbbjQ8KWtT_Sc',
    appId: '1:213938927212:ios:2e88374d402032ea0dca49',
    messagingSenderId: '213938927212',
    projectId: 'myopia-11ddc',
    storageBucket: 'myopia-11ddc.appspot.com',
    iosBundleId: 'com.example.myopia',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQrwnk31Orvb0rCaeAiWWbbjQ8KWtT_Sc',
    appId: '1:213938927212:ios:0f5053b52128da6e0dca49',
    messagingSenderId: '213938927212',
    projectId: 'myopia-11ddc',
    storageBucket: 'myopia-11ddc.appspot.com',
    iosBundleId: 'com.example.myopia.RunnerTests',
  );
}

// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCUxfGmJVRJr4VDnQq_GyUeBl1D_98qQlY',
    appId: '1:366942149623:web:45cbf2943c4db1d338acf2',
    messagingSenderId: '366942149623',
    projectId: 'language-translator-d57c9',
    authDomain: 'language-translator-d57c9.firebaseapp.com',
    storageBucket: 'language-translator-d57c9.appspot.com',
    measurementId: 'G-9S1HZN529F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC7qgXfQ6ezdd6IH5RnC9QnO2oCPWA3ja0',
    appId: '1:366942149623:android:aaf05e42d819af1238acf2',
    messagingSenderId: '366942149623',
    projectId: 'language-translator-d57c9',
    storageBucket: 'language-translator-d57c9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyARQgH5gpx7JSXwGHsP-bySYxTbJDOG5jk',
    appId: '1:366942149623:ios:5dd8834f0d6adfdf38acf2',
    messagingSenderId: '366942149623',
    projectId: 'language-translator-d57c9',
    storageBucket: 'language-translator-d57c9.appspot.com',
    iosBundleId: 'com.example.loginPage',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyARQgH5gpx7JSXwGHsP-bySYxTbJDOG5jk',
    appId: '1:366942149623:ios:5dd8834f0d6adfdf38acf2',
    messagingSenderId: '366942149623',
    projectId: 'language-translator-d57c9',
    storageBucket: 'language-translator-d57c9.appspot.com',
    iosBundleId: 'com.example.loginPage',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCUxfGmJVRJr4VDnQq_GyUeBl1D_98qQlY',
    appId: '1:366942149623:web:7bba065b0bc1c20a38acf2',
    messagingSenderId: '366942149623',
    projectId: 'language-translator-d57c9',
    authDomain: 'language-translator-d57c9.firebaseapp.com',
    storageBucket: 'language-translator-d57c9.appspot.com',
    measurementId: 'G-8EXM7MWV3Y',
  );
}

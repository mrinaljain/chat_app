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
    apiKey: 'AIzaSyB5ce2iDqRRvKxjeA0-SYmtZeJigUEw2so',
    appId: '1:718292837857:web:814751ba2898e0cedf5ea0',
    messagingSenderId: '718292837857',
    projectId: 'flutter-chat-a4249',
    authDomain: 'flutter-chat-a4249.firebaseapp.com',
    storageBucket: 'flutter-chat-a4249.appspot.com',
    measurementId: 'G-18YRMTLCBR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBf8sc_GRAkRaz_t5vicaunag8Ki3LaV1w',
    appId: '1:718292837857:android:d670257c3223fb7cdf5ea0',
    messagingSenderId: '718292837857',
    projectId: 'flutter-chat-a4249',
    storageBucket: 'flutter-chat-a4249.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA2mW8ucKeqyZcu4rTDwCxg2y-hOzcdUGU',
    appId: '1:718292837857:ios:01406ffff4ba44d1df5ea0',
    messagingSenderId: '718292837857',
    projectId: 'flutter-chat-a4249',
    storageBucket: 'flutter-chat-a4249.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA2mW8ucKeqyZcu4rTDwCxg2y-hOzcdUGU',
    appId: '1:718292837857:ios:0fae3ba2b89b0291df5ea0',
    messagingSenderId: '718292837857',
    projectId: 'flutter-chat-a4249',
    storageBucket: 'flutter-chat-a4249.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
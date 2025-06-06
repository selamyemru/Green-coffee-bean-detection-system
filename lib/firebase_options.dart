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
    apiKey: 'AIzaSyCgtAzyP_K8k6S3gBbZB-hwgrSH0Bt4vhQ',
    appId: '1:262220095299:web:1cc426a6b67903c61259f6',
    messagingSenderId: '262220095299',
    projectId: 'green-coffee-bean-system',
    authDomain: 'green-coffee-bean-system.firebaseapp.com',
    storageBucket: 'green-coffee-bean-system.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDv1VJWuVAlz--QDNk5CWZKdOUNWTrgwD8',
    appId: '1:262220095299:android:1dca80d7d827b64e1259f6',
    messagingSenderId: '262220095299',
    projectId: 'green-coffee-bean-system',
    storageBucket: 'green-coffee-bean-system.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvyYkD_y72C8MTG49fkGmrgnA8xQbkhuU',
    appId: '1:262220095299:ios:675a0db84ccfe34b1259f6',
    messagingSenderId: '262220095299',
    projectId: 'green-coffee-bean-system',
    storageBucket: 'green-coffee-bean-system.firebasestorage.app',
    iosBundleId: 'com.example.coffeeBeenDetectionSystem',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvyYkD_y72C8MTG49fkGmrgnA8xQbkhuU',
    appId: '1:262220095299:ios:675a0db84ccfe34b1259f6',
    messagingSenderId: '262220095299',
    projectId: 'green-coffee-bean-system',
    storageBucket: 'green-coffee-bean-system.firebasestorage.app',
    iosBundleId: 'com.example.coffeeBeenDetectionSystem',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCgtAzyP_K8k6S3gBbZB-hwgrSH0Bt4vhQ',
    appId: '1:262220095299:web:17f154c12efa13581259f6',
    messagingSenderId: '262220095299',
    projectId: 'green-coffee-bean-system',
    authDomain: 'green-coffee-bean-system.firebaseapp.com',
    storageBucket: 'green-coffee-bean-system.firebasestorage.app',
  );
}

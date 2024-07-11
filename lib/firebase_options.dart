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
    apiKey: 'AIzaSyARTIfxZw6q0qGAPM-KpWkgVL0dz3_iCNg',
    appId: '1:509478144056:web:a07260f6f93be651bf3ecd',
    messagingSenderId: '509478144056',
    projectId: 'uaspemmobile',
    authDomain: 'uaspemmobile.firebaseapp.com',
    storageBucket: 'uaspemmobile.appspot.com',
    measurementId: 'G-3Y95ZKRTH8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU2Zz5wCfrTyH4HZkHl0LcN2Wr72tNE9I',
    appId: '1:509478144056:android:21cc07dff5e3a657bf3ecd',
    messagingSenderId: '509478144056',
    projectId: 'uaspemmobile',
    storageBucket: 'uaspemmobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBS3IuZiunU44_sZY_nDcevVK3MD2Ieh60',
    appId: '1:509478144056:ios:dcc91ba03329ea76bf3ecd',
    messagingSenderId: '509478144056',
    projectId: 'uaspemmobile',
    storageBucket: 'uaspemmobile.appspot.com',
    iosBundleId: 'com.example.utsPemmobile',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBS3IuZiunU44_sZY_nDcevVK3MD2Ieh60',
    appId: '1:509478144056:ios:dcc91ba03329ea76bf3ecd',
    messagingSenderId: '509478144056',
    projectId: 'uaspemmobile',
    storageBucket: 'uaspemmobile.appspot.com',
    iosBundleId: 'com.example.utsPemmobile',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARTIfxZw6q0qGAPM-KpWkgVL0dz3_iCNg',
    appId: '1:509478144056:web:856460a916ffc8b9bf3ecd',
    messagingSenderId: '509478144056',
    projectId: 'uaspemmobile',
    authDomain: 'uaspemmobile.firebaseapp.com',
    storageBucket: 'uaspemmobile.appspot.com',
    measurementId: 'G-BWNEM3E4CC',
  );
}

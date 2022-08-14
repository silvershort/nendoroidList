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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB3S3GJ8ax5jBBQn4LK5sVpQvmLMNwpIDE',
    appId: '1:647472862543:web:3f23914758bc448cb5613a',
    messagingSenderId: '647472862543',
    projectId: 'nendoroidlist',
    authDomain: 'nendoroidlist.firebaseapp.com',
    storageBucket: 'nendoroidlist.appspot.com',
    measurementId: 'G-M8ZL7R3XXS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC8aa6QtLK3pB_4C11-dM_dXIQzaEvjUGU',
    appId: '1:647472862543:android:68d0d635db0a2cf7b5613a',
    messagingSenderId: '647472862543',
    projectId: 'nendoroidlist',
    storageBucket: 'nendoroidlist.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZGWfScwIWLUhl6V-lnxOzQv9fUAkd1Gg',
    appId: '1:647472862543:ios:ea3641e82aaf7046b5613a',
    messagingSenderId: '647472862543',
    projectId: 'nendoroidlist',
    storageBucket: 'nendoroidlist.appspot.com',
    iosClientId: '647472862543-1ocbilhov6mch8odljv25fogq82csmhp.apps.googleusercontent.com',
    iosBundleId: 'com.silvershort.nendoroiddb',
  );
}

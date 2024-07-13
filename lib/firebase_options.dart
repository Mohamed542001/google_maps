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
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBM5YUG7g6Pf8FroBwydn-x8VOAs6kcMVw',
    appId: '1:1065486725923:android:baa54c63596f8843ef9296',
    messagingSenderId: '1065486725923',
    projectId: 'ai-madle',
    storageBucket: 'ai-madle.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBemgQQuf99jw0YOGaY3dIBUSkjjGqS1K4',
    appId: '1:891726324751:ios:40469c0eadf3ec46a22f7a',
    messagingSenderId: '891726324751',
    projectId: 'drmath-28faa',
    storageBucket: 'drmath-28faa.appspot.com',
    iosBundleId: 'com.learn.drmath',
  );
}
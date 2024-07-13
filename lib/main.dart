import 'package:google_maps/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/src/app.dart';
import 'core/src/app_export.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initGetIt();
  Bloc.observer = AppBlocObserver();
  await Future.delayed(const Duration(seconds: 3));

  Future.wait([
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]).then((value) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
        Platform.isIOS ? Brightness.light : Brightness.dark,
      ),
    );
    runApp(const MyApp());
  });
}

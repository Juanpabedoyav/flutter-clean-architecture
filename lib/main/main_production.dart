import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/configs/firebase/firebase_options_prod.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:flutter_clean_architecture/main/app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await mainCommon(AppEnvironment.PROD);
  await Firebase.initializeApp(
    name: 'flutter-prod-53299',
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

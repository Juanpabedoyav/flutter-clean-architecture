import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_architecture/firebase_options_dev.dart';
import 'package:flutter_clean_architecture/main.dart';
import 'package:flutter_clean_architecture/main/app_env.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: 'flutter-dev-ec416',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await mainCommon(AppEnvironment.DEV);
}

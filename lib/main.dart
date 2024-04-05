import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/features/trip/data/models/trip_model.dart';
import 'package:flutter_clean_architecture/main/app.dart';
import 'package:flutter_clean_architecture/main/app_env.dart';
import 'package:flutter_clean_architecture/main/observers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() => mainCommon(AppEnvironment.PROD);

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.red,
      statusBarBrightness: Brightness.light,
    ),
  );
  await Hive.initFlutter((await getApplicationDocumentsDirectory()).path);
  Hive.registerAdapter(TripModelAdapter());
  await Hive.openBox('trips');

  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const MyApp(),
    ),
  );
}

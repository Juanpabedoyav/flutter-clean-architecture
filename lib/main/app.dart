import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/configs/flavor_banner.dart';
import 'package:flutter_clean_architecture/main/app_env.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: EnvInfo.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: flavorBanner(const Text('hola')),
    );
  }
}

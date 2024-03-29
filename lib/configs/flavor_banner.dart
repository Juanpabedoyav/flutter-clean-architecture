import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/main/app_env.dart';

@override
Widget flavorBanner(Widget child) {
  if (EnvInfo.environment == AppEnvironment.STAGING ||
      EnvInfo.environment == AppEnvironment.DEV) {
    return Banner(
      location: BannerLocation.bottomEnd,
      message: EnvInfo.appName,
      color: Colors.red.withOpacity(0.6),
      textStyle: const TextStyle(
          fontWeight: FontWeight.w700, fontSize: 14.0, letterSpacing: 1.0),
      textDirection: TextDirection.ltr,
      child: child,
    );
  }
  return child;
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'package:timer_lafay/screens/home.dart';
import 'package:timer_lafay/screens/loading.dart';
import 'package:timer_lafay/screens/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Google Mobile Ads SDK
  MobileAds.instance.initialize();

  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false, // To remove debug banner
        initialRoute: '/',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageRouteBuilder(
                  settings:
                      settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (_, __, ___) => const Loading(),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c));
            case '/home':
              return PageRouteBuilder(
                  settings:
                      settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (_, __, ___) => const Home(),
                  transitionsBuilder: (_, a, __, c) =>
                      FadeTransition(opacity: a, child: c));
            case '/settings':
              return PageRouteBuilder(
                  settings:
                      settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                  pageBuilder: (_, __, ___) => const Settings(),
                  transitionsBuilder: (_, a, __, c) => SlideTransition(
                      position:
                          Tween(begin: const Offset(1, 0), end: Offset.zero)
                              .animate(a),
                      child: c));
          }
          return null;
        },
        theme: ThemeData(
          colorScheme: ColorScheme.dark(
            primary: Colors.white,
            secondary: Colors.amber[600]!,
            onPrimary: Colors.white, // text color
          ),
        )),
  );
}

import 'package:flutter/material.dart';
import 'package:investo/global/splash/view/splash_screen.dart';
import 'package:investo/views/bottom_nav/view/bottom_nav.dart';
import 'package:investo/views/home/view/home_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //*---------------------------------(Splash_route)
  '/': (BuildContext context) => const SplashScreen(),
  //*-----------------------------------(bottom_nav)
  '/bottomNav': (BuildContext context) => const BottomNav(),
  //*-----------------------------------(home_screen)
  '/home': (BuildContext context) => const HomeScreen(),
};

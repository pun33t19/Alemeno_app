import 'package:flutter/material.dart';
import 'package:hungry_bruno_puneet_shetty/features/home/home_screen.dart';
import 'package:hungry_bruno_puneet_shetty/features/share/screens/land_click_screen.dart';
import 'package:routemaster/routemaster.dart';

class AppRouter {
  static final routes = RouteMap(routes: {
    '/': (_) => const MaterialPage(child: HomeScreen()),
    '/land-click-picture': (_) => const MaterialPage(child: LandClickScreen())
  });
}

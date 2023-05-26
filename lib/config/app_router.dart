import 'dart:developer';

import 'package:first_challenge/screens/home/details_screen.dart';
import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case DetailsScreen.routeName:
        return DetailsScreen.route(settings.arguments as String);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(
                  title: const Text(
                "Error",
                textAlign: TextAlign.center,
              )),
            ));
  }
}

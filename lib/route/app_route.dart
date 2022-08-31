import 'package:flutter/material.dart';
import 'package:yaaseen/route/route_names.dart';
import 'package:yaaseen/screens/home/home_screen.dart';
import 'package:yaaseen/screens/splash/splash.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return _route(const SplashScreen());

      case RouteNames.home:
        return _route(const HomeScreen());

      // case RouteNames.sura_details:
      //   return _route(const SuraScreen());

      // default:
      //   return _route(const HomeScreen());
    }
    return null;
  }

  MaterialPageRoute _route(Widget route) =>
      MaterialPageRoute(builder: (_) => route);
}

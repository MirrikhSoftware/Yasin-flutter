import 'package:flutter/material.dart';
import 'package:yaaseen/route/route_names.dart';
import 'package:yaaseen/screens/home/bookmarks.dart';
import 'package:yaaseen/screens/home/home_screen.dart';
import 'package:yaaseen/screens/home/reading_mode_screen.dart';
import 'package:yaaseen/screens/settings/settings_screen.dart';
import 'package:yaaseen/screens/splash/splash.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.initial:
        return _route(const SplashScreen());

      case RouteNames.home:
        return _route(const HomeScreen());

      case RouteNames.settings:
        return _route(const SettingsScreen());

      case RouteNames.reading:
        return _route(const ReadingModeScreen());

      case RouteNames.bookmarks:
        return _route(const BookmarksScreen());
    }
    return null;
  }

  MaterialPageRoute _route(Widget route) =>
      MaterialPageRoute(builder: (_) => route);
}

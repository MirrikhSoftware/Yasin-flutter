import 'package:flutter/material.dart';
import 'package:yaaseen/route/route_names.dart';
import 'package:yaaseen/screens/book/book_page.dart';
import 'package:yaaseen/screens/screens.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.home:
        return _route(const HomeScreen());

      case RouteNames.settings:
        return _route(const SettingsScreen());

      case RouteNames.reading:
        return _route(const ReadingModeScreen());

      case RouteNames.bookmarks:
        return _route(const BookmarksScreen());

      case RouteNames.about:
        return _route(const AboutScreen());

      case RouteNames.paged:
        return _route(const BookViewPage());

      // case RouteNames.test:
      //   return _route(const TestScreen());
    }
    return null;
  }

  MaterialPageRoute _route(Widget route) => MaterialPageRoute(
        builder: (_) => route,
      );
}

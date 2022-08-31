import 'package:flutter/material.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/theme/app_theme.dart';
import 'route/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, w) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Yosin Surasi',
        theme: AppTheme().green,
        navigatorKey: AppNavigator.navigatorKey,
        initialRoute: RouteNames.initial,
        onGenerateRoute: AppRoutes().onGenerateRoute,
      );
    });
  }
}

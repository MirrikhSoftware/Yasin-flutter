import 'package:flutter/material.dart';
import 'route/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Yosin Surasi',
      navigatorKey: AppNavigator.navigatorKey,
      initialRoute: RouteNames.initial,
      onGenerateRoute: AppRoutes().onGenerateRoute,
    );
  }
}

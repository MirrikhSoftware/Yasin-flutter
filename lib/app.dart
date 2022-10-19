import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/app_strings.dart';
import 'package:yaaseen/core/theme/app_theme.dart';
import 'package:yaaseen/services/analytics_service.dart';
import 'route/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, w) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SettingsBloc()),
          BlocProvider(create: (_) => PlayerBloc()),
          BlocProvider(create: (_) => NewsBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppStrings.app_name.tr(),
          theme: AppTheme().green,
          navigatorKey: AppNavigator.navigatorKey,
          initialRoute: RouteNames.initial,
          onGenerateRoute: AppRoutes().onGenerateRoute,
          navigatorObservers: [
            AnalyticsService.getAnalyticsObserver(),
          ],
        ),
      );
    });
  }
}

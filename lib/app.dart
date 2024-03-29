import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/core/constants/app_strings.dart';
import 'package:yaaseen/core/theme/app_theme.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'bloc/audio/audio_bloc.dart';
import 'route/routes.dart';
import 'services/app_audio_service.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SettingsBloc()..add(const SettingsEvent.started()),
        ),
        BlocProvider(
          create: (_) => AudioBloc(audioService: AppAudioService(AudioPlayer()))
            ..add(const AudioEvent.started()),
        ),
        BlocProvider(
          create: (_) => NetworkBloc(Connectivity())
            ..add(
              const NetworkEvent.listened(),
            ),
        )
      ],
      child: BlocListener<NetworkBloc, NetworkState>(
        listener: (context, state) {
          if (state is NetworkSuccess) {
            LogService.sendFromStorage();
          }
        },
        child: MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: AppStrings.app_name.tr(),
            theme: AppTheme().green,
            navigatorKey: AppNavigator.navigatorKey,
            initialRoute: RouteNames.home,
            onGenerateRoute: AppRoutes().onGenerateRoute,
            // navigatorObservers: [
            //   AnalyticsService.getAnalyticsObserver(),
            // ],
          ),
        ),
      ),
    );
  }
}

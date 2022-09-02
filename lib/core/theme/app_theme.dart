import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yaaseen/core/core.dart';

class AppTheme {
  ThemeData get light => ThemeData(

        primaryColor: AppColors.primary,
        iconTheme: const IconThemeData(color: AppColors.primary),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.primary),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: AppColors.primary),
            systemOverlayStyle:
                SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark)),

        scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            crossAxisMargin: 6.w,
            radius: Radius.circular(3.r),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.primary)),
      );

  ThemeData get green => ThemeData(
        canvasColor: AppColors.background,
        primaryColor: AppColors.green,
        // splashColor: AppColors.,
        primaryColorLight: AppColors.green,
        iconTheme: const IconThemeData(color: AppColors.green),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.green),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.green,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.green,
            statusBarIconBrightness: Brightness.light
          )
        ),
        sliderTheme: SliderThemeData(
          trackHeight: 2.h,
          thumbColor: AppColors.green,
          activeTrackColor: AppColors.green,
          inactiveTrackColor: AppColors.green.withOpacity(.5),
          showValueIndicator: ShowValueIndicator.always
        ),
        scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            crossAxisMargin: 6.w,
            radius: Radius.circular(3.r),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.green)),
      );

  ThemeData get indigo => ThemeData(
        // canvasColor: AppColors.background,

        primaryColor: AppColors.indigo,
        iconTheme: const IconThemeData(color: AppColors.indigo),
        buttonTheme: const ButtonThemeData(buttonColor: AppColors.indigo),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.indigo,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.white),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
        ),

        scrollbarTheme: ScrollbarThemeData(
            interactive: true,
            crossAxisMargin: 6.w,
            radius: Radius.circular(3.r),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.indigo)),
      );
}

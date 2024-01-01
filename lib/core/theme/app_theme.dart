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
            crossAxisMargin: 6.0,
            radius: const Radius.circular(3.0),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.primary)),
      );

  ThemeData get green => ThemeData(
      useMaterial3: false,
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
              statusBarIconBrightness: Brightness.light)),
      sliderTheme: SliderThemeData(
          trackHeight: 2.0,
          // trackShape: CustomTrackShape(),
          overlayShape: SliderComponentShape.noOverlay,
          thumbColor: AppColors.green,
          activeTrackColor: AppColors.green,
          inactiveTrackColor: AppColors.green.withOpacity(.5),
          showValueIndicator: ShowValueIndicator.always),
      scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          crossAxisMargin: 6.0,
          radius: const Radius.circular(3.0),
          thumbColor: MaterialStateProperty.all<Color>(AppColors.green)),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: AppColors.white,
        filled: true,
        border: _border,
        errorBorder: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        disabledBorder: _border,
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
          color: AppColors.green,
          linearTrackColor: AppColors.green.withOpacity(.36)));

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
            crossAxisMargin: 6.0,
            radius: const Radius.circular(3.0),
            thumbColor: MaterialStateProperty.all<Color>(AppColors.indigo)),
      );

  UnderlineInputBorder get _border => const UnderlineInputBorder(
        borderSide: BorderSide.none,
      );
}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 0;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}

import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/core/core.dart';

class ArabicText extends StatelessWidget {
  final String arabic;
  final TextAlign textAlign;
  final String? target;
  final double? fontSize;
  final String? fontFamily;
  const ArabicText({
    Key? key,
    required this.arabic,
    required this.textAlign,
    this.target,
    this.fontSize,
    this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.centerRight,
          child: Text(
            arabic,
            textAlign: textAlign,
            locale: const Locale('ar'),
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: fontSize ?? context.watch<SettingsBloc>().arabicSize,
              fontFamily: fontFamily ?? AppFonts.meQuran,
              wordSpacing: 12,
              height: 1.8,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

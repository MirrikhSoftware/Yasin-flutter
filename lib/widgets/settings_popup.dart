/*

  Created by: Bakhromjon Polat
  Created on: Jan 03 2024 21:22:05
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/settings/settings_bloc.dart';
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/widgets/language_buttons.dart';
import 'package:yaaseen/widgets/text_size_slider.dart';

class SettingsPopup extends StatefulWidget {
  final ValueChanged<String> onLocaleChanged;
  const SettingsPopup({super.key, required this.onLocaleChanged});

  @override
  State<SettingsPopup> createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  @override
  Widget build(BuildContext context) {
    final settingsBloc = context.read<SettingsBloc>();
    return AlertDialog(
      alignment: Alignment.topRight,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: BlocBuilder<SettingsBloc, SettingsState>(
        bloc: settingsBloc,
        builder: (context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LanguageButtons(
                locale: AppPref.locale,
                onLocaleChanged: (value) {
                  widget.onLocaleChanged(value);
                  setState(() {});
                },
              ),
              const SizedBox(height: 12),
              TextSizeSlider(
                title: AppStrings.arabic_text.tr(),
                textSize: state.arabicSize,
                checkBoxValue: state.showArabic,
                enable: state.showMeaning || state.showTranscription,
                onChecked: (value) {
                  settingsBloc.add(SettingsEvent.showTexts(showArabic: value));
                },
                onSlides: (value) {
                  settingsBloc.add(SettingsEvent.arabicSizeChanged(value));
                },
              ),
              TextSizeSlider(
                title: AppStrings.meaning.tr(),
                textSize: state.meaningSize,
                checkBoxValue: state.showMeaning,
                enable: state.showArabic || state.showTranscription,
                onChecked: (value) {
                  settingsBloc.add(SettingsEvent.showTexts(showMeaning: value));
                },
                onSlides: (value) {
                  settingsBloc.add(SettingsEvent.meaningSizeChanged(value));
                },
              ),
              TextSizeSlider(
                title: AppStrings.transcription.tr(),
                textSize: state.transcriptionSize,
                checkBoxValue: state.showTranscription,
                enable: state.showArabic || state.showMeaning,
                onChecked: (value) {
                  settingsBloc
                      .add(SettingsEvent.showTexts(showTranscription: value));
                },
                onSlides: (value) {
                  settingsBloc
                      .add(SettingsEvent.transcriptionSizeChanged(value));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

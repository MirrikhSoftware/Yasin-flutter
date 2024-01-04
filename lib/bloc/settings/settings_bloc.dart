import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState.initial()) {
    on<_Started>(
      (event, emit) {
        final arabicSize = AppPref.arabicSize;
        final meaningSize = AppPref.meaningSize;
        final trSize = AppPref.trSize;
        final showArabic = AppPref.getBool(
          HiveKeys.showArabic,
          defaultValue: true,
        );
        final showMeaning = AppPref.getBool(
          HiveKeys.showMeaning,
          defaultValue: true,
        );
        final showTranscription = AppPref.getBool(
          HiveKeys.showTranscription,
          defaultValue: true,
        );
        emit(state.copyWith(
          arabicSize: arabicSize,
          meaningSize: meaningSize,
          transcriptionSize: trSize,
          showArabic: showArabic,
          showMeaning: showMeaning,
          showTranscription: showTranscription,
        ));
      },
    );
    on<_ArabicTextSizeChanged>(_changeArabicTextSize);
    on<_MeaningTextSizeChanged>(_changeMeaningTextSize);
    on<_TranscriptionTextSizeChanged>(_changeTranscriptionTextSize);
    on<_ShowTexts>(_showTexts);
  }

  Future<void> _showTexts(
    _ShowTexts event,
    Emitter<SettingsState> emit,
  ) async {
    if (event.showArabic != null) {
      await AppPref.setBool(
        HiveKeys.showArabic,
        event.showArabic ?? state.showArabic,
      );
    }
    if (event.showMeaning != null) {
      await AppPref.setBool(
        HiveKeys.showMeaning,
        event.showMeaning ?? state.showMeaning,
      );
    }
    if (event.showTranscription != null) {
      await AppPref.setBool(
        HiveKeys.showTranscription,
        event.showTranscription ?? state.showTranscription,
      );
    }

    emit(state.copyWith(
      showArabic: event.showArabic,
      showMeaning: event.showMeaning,
      showTranscription: event.showTranscription,
    ));
  }

  FutureOr<void> _changeArabicTextSize(
    _ArabicTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPref.setArabicSize(event.size);
    emit(state.copyWith(arabicSize: event.size));
  }

  FutureOr<void> _changeMeaningTextSize(
    _MeaningTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPref.setMeaningSize(event.size);
    emit(state.copyWith(meaningSize: event.size));
  }

  FutureOr<void> _changeTranscriptionTextSize(
    _TranscriptionTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPref.setTranscriptionSize(event.size);
    emit(state.copyWith(transcriptionSize: event.size));
  }
}

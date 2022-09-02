import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  double _arabicSize = AppPrefs.arabicSize;
  double _meaingSize = AppPrefs.meaningSize;
  double _trSize = AppPrefs.trSize;
  String _locale = AppPrefs.locale;

  double get arabicSize => _arabicSize;
  double get meaingSize => _meaingSize;
  double get trSize => _trSize;
  String get locale => _locale;

  SettingsBloc() : super(SettingsInitial()) {
    on<ArabicTextSizeChanged>(_changeArabicTextSize);
    on<MeaningTextSizeChanged>(_changeMeaingTextSize);
    on<TranscriptionTextSizeChanged>(_changeTranscriptionTextSize);
  }

  FutureOr<void> _changeArabicTextSize(
    ArabicTextSizeChanged event,
    Emitter emit,
  ) async {
    _arabicSize = event.size;
    emit(SettingsInitial());
  }

  FutureOr<void> _changeMeaingTextSize(
    MeaningTextSizeChanged event,
    Emitter emit,
  ) async {
    _meaingSize = event.size;
    emit(SettingsInitial());
  }

  FutureOr<void> _changeTranscriptionTextSize(
    TranscriptionTextSizeChanged event,
    Emitter emit,
  ) async {
    _trSize = event.size;
    emit(SettingsInitial());
  }
}

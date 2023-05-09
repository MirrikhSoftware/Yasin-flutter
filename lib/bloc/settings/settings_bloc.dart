import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  double _arabicSize = AppPref.arabicSize;
  double _meaingSize = AppPref.meaningSize;
  double _trSize = AppPref.trSize;

  double get arabicSize => _arabicSize;
  double get meaingSize => _meaingSize;
  double get trSize => _trSize;

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

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
        emit(state.copyWith(
          arabicSize: arabicSize,
          meaningSize: meaningSize,
          transcriptionSize: trSize,
        ));
      },
    );
    on<ArabicTextSizeChanged>(_changeArabicTextSize);
    on<MeaningTextSizeChanged>(_changeMeaningTextSize);
    on<TranscriptionTextSizeChanged>(_changeTranscriptionTextSize);
  }

  FutureOr<void> _changeArabicTextSize(
    ArabicTextSizeChanged event,
    Emitter emit,
  ) async {
    emit(state.copyWith(arabicSize: event.size));
  }

  FutureOr<void> _changeMeaningTextSize(
    MeaningTextSizeChanged event,
    Emitter emit,
  ) async {
    emit(state.copyWith(meaningSize: event.size));
  }

  FutureOr<void> _changeTranscriptionTextSize(
    TranscriptionTextSizeChanged event,
    Emitter emit,
  ) async {
    emit(state.copyWith(transcriptionSize: event.size));
  }
}

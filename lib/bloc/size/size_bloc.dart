import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'size_event.dart';
part 'size_state.dart';

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  SizeBloc() : super(SizeInitial()) {
    on<ArabicTextSizeChanged>(_changeArabicTextSize);
    on<MeaningTextSizeChanged>(_changeMeaingTextSize);
    on<TranscriptionTextSizeChanged>(_changeTranscriptionTextSize);
  }

  FutureOr<void> _changeArabicTextSize(
    ArabicTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPrefs.setArabicSize(event.size);
    emit(SizeInitial());
  }

  FutureOr<void> _changeMeaingTextSize(
    MeaningTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPrefs.setMeaingSize(event.size);
    emit(SizeInitial());
  }

  FutureOr<void> _changeTranscriptionTextSize(
    TranscriptionTextSizeChanged event,
    Emitter emit,
  ) async {
    await AppPrefs.setTranscriptionSize(event.size);
    emit(SizeInitial());
  }
}

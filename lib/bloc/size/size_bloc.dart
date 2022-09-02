import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'size_event.dart';
part 'size_state.dart';

class SizeBloc extends Bloc<SizeEvent, SizeState> {
  double _arabicSize = AppPrefs.arabicSize;
  double _meaingSize = AppPrefs.meaningSize;
  double _trSize = AppPrefs.trSize;

  get arabicSize => _arabicSize;
  get meaingSize => _meaingSize;
  get trSize => _trSize;

  SizeBloc() : super(SizeInitial()) {
    on<ArabicTextSizeChanged>(_changeArabicTextSize);
    on<MeaningTextSizeChanged>(_changeMeaingTextSize);
    on<TranscriptionTextSizeChanged>(_changeTranscriptionTextSize);
  }

  FutureOr<void> _changeArabicTextSize(
    ArabicTextSizeChanged event,
    Emitter emit,
  ) async {
    _arabicSize = event.size;
    await AppPrefs.setArabicSize(event.size);
    emit(SizeInitial());
  }

  FutureOr<void> _changeMeaingTextSize(
    MeaningTextSizeChanged event,
    Emitter emit,
  ) async {
    _meaingSize = event.size;
    await AppPrefs.setMeaingSize(event.size);
    emit(SizeInitial());
  }

  FutureOr<void> _changeTranscriptionTextSize(
    TranscriptionTextSizeChanged event,
    Emitter emit,
  ) async {
    _trSize = event.size;
    await AppPrefs.setTranscriptionSize(event.size);
    emit(SizeInitial());
  }
}

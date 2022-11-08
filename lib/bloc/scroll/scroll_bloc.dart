import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scroll_event.dart';
part 'scroll_state.dart';

class ScrollBloc extends Bloc<ScrollEvent, ScrollState> {
  ScrollBloc() : super(ScrollInitial()) {
    on<ScrollEvent>((event, emit) {});
  }
}

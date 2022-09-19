import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yaaseen/models/feedback/feedback_model.dart';
import 'package:yaaseen/services/api_service.dart';
import 'package:yaaseen/services/http_result.dart';

part 'feedback_event.dart';
part 'feedback_state.dart';

class FeedbackBloc extends Bloc<FeedbackEvent, FeedbackState> {
  FeedbackBloc() : super(FeedbackInitial()) {
    on<SendFeedbackEvent>(_sendFeedback);
  }

  FutureOr<void> _sendFeedback(
    SendFeedbackEvent event,
    Emitter emit,
  ) async {
    FeedbackModel feedback = FeedbackModel(
      date: DateTime.now().millisecondsSinceEpoch,
      isSent: false,
      message: event.message,
    );
    // await 

    HttpResult result = await ApiService.sendFeedback(event.message);
    // if ()
  }
}

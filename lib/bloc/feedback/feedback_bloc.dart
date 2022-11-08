import 'dart:async';

import 'package:yaaseen/core/core.dart';
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
    FeedbackModel feedback = event.feedback;
    HttpResult result = await ApiService.sendFeedback(feedback.message!);
    if (result.isSuccess) {
      feedback
        ..isSent = true
        ..hasError = false
        ..date = DateTime.now().millisecondsSinceEpoch;
    } else {
      feedback
        ..hasError = true
        ..date = DateTime.now().millisecondsSinceEpoch;
    }

    await feedback.save();
  }
}

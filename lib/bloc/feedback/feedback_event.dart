part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent {}

class SendFeedbackEvent extends FeedbackEvent {
  final FeedbackModel feedback;
  SendFeedbackEvent(this.feedback);
}

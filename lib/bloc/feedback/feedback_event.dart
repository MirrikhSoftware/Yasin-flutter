part of 'feedback_bloc.dart';

@immutable
abstract class FeedbackEvent {}

class SendFeedbackEvent extends FeedbackEvent {
  final String message;
  SendFeedbackEvent(this.message);
}

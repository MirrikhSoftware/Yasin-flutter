part of 'language_bloc.dart';

abstract class LanguageEvent {}
class LocaleChangedEvent extends LanguageEvent {
  final String locale;
  LocaleChangedEvent(this.locale);
}

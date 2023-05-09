import 'dart:async';

import 'package:yaaseen/core/components/components.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'language_event.dart';
part 'language_state.dart';

/// It's a Bloc that emits a LanguageState when a LocaleChangedEvent is received
class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageState('cr')) {
    on<LocaleChangedEvent>(_changeLanguage);
  }

  FutureOr<void> _changeLanguage(
    LocaleChangedEvent event,
    Emitter emit,
  ) async {
    await AppPref.setLocale(event.locale);
    emit(LanguageState(event.locale));
  }
}

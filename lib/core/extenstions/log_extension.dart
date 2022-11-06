import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';

extension Log on Object? {
  void log({String name = '', Object? error}) {
    dev.log(
      toString(),
      name: name,
      error: error,
      time: DateTime.now(),
    );
  }

  void printf({String name = '', bool isError = false}) {
    if (kDebugMode) {
      name = name.isEmpty ? '' : '[$name]';

      String code = isError ? '\x1B[91m' : '\x1B[92m';
      String text = '\x1B[94m$_time: \x1B[93m$name $code${toString()}\x1B[0m';
      print(text);
    }
  }

  String get _time {
    DateTime now = DateTime.now(); 
    return now.toString();
  }
}

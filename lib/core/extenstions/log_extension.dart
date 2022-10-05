import 'dart:developer' as dev;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

extension Log on Object? {
  log({String name = '', Object? error}) {
    dev.log(
      toString(),
      name: name,
      error: error,
      time: DateTime.now(),
    );
  }

  printf() {
    if (kDebugMode) {
      TimeOfDay now = TimeOfDay.now();
      String time = '${now.hour}:${now.minute}';
      String text = '\x1B[94m$time: ${toString()}\x1B[0m';
      print(text);
    }
  }

  error({String name = ''}) {
    if (kDebugMode) {
      TimeOfDay now = TimeOfDay.now();
      String time = '${now.hour}:${now.minute}';
      name = name.isNotEmpty ? '"$name => "' : '';
      String text = '\x1B[91m$time: [$name] ${toString()}\x1B[0m';
      print(text);
    }
  }
}

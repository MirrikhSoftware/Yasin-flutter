/*

  Created by: Bakhromjon Polat
  Created on: Jan 02 2024 23:10:33
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Log {
  const Log._();

  static void d(Object? object, {String name = ''}) {
    if (kDebugMode) {
      name = name.isEmpty ? '' : '[$name]';
      String text =
          '\x1B[94m${_getDate()}: \x1B[93m$name \x1B[92m$object\x1B[0m';
      print(text);
    }
  }

  // print errors
  static void e(Object? object, {String name = ''}) {
    if (kDebugMode) {
      name = name.isEmpty ? '' : '[$name]';
      String text =
          '\x1B[94m${_getDate()}: \x1B[93m$name\x1B[91m$object\x1B[0m';
      print(text);
    }
  }

  // Pretty-print JSON
  static void j(Object? object, {String name = ''}) {
    if (kDebugMode) {
      name = name.isEmpty ? '' : '[$name]';
      JsonEncoder encoder = const JsonEncoder.withIndent(' ');
      String prettyJson = encoder.convert(object);
      String text =
          '\x1B[94m${_getDate()}: \x1B[93m$name\n\n\x1B[92m$prettyJson\x1B[0m';
      print(text);
    }
  }

  static formatJson(String json) {
    json = json.replaceAll(RegExp(r'"[]"'), '');
  }

  static String _getDate() {
    DateTime now = DateTime.now();
    String hour = now.hour.toString().padLeft(2, '0');
    String minute = now.minute.toString().padLeft(2, '0');
    String second = now.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }
}

extension LogExt on dynamic {
  void logD({String name = ''}) {
    Log.d(toString(), name: name);
  }

  void logE({String name = ''}) {
    Log.e(toString(), name: name);
  }

  void logJ({String name = ''}) {
    Log.j(this, name: name);
  }
}

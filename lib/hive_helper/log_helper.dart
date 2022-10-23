import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/models/models.dart';
import 'package:yaaseen/screens/test/app_secure.dart';
import 'package:yaaseen/services/services.dart';

class LogHelper {
  static final Box _box = HiveBoxes.logBox;

  static Future addLog(
    String message, {
    String file = '',
    String type = 'FAIL',
    String method = 'POST',
    String path = '/',
    String url = '',
    int statusCode = 200,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;

    LogModel log = LogModel(
      date: AppFormatter().formatDate(DateTime.now()),
      message: message,
      type: 'FAIL',
      file: file,
      userId: user?.uid,
      openedTime: AppPrefs.counter,
    );
    HttpResult result = await LogService._sendToTelegram(log);

    if (!result.isSuccess) {
      await _box.add(log);
    }
  }
}

class LogService {
  static Future<HttpResult> _sendToTelegram(LogModel log) async {
    try {
      String message = await _logToString(log);
      Uri url = Uri.parse('${DotEnv.telegramLink}$message');

      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return HttpResult(statusCode: 200, isSuccess: true, response: '');
      }
      return HttpResult(statusCode: 1000, response: '');
    } catch (err) {
      return HttpResult(statusCode: 1000, response: '');
    }
  }

  static Future<String> _logToString(LogModel log) async {
    const versionUrl =
        'https://github.com/Invan-Soft/tiin-cashback-v2.0/tree/7376b0839357d265b578fc92a7ca1f26c40e575a';
    final String platform = Platform.isAndroid ? 'Android' : 'iOS';
    const String mode = kDebugMode ? 'debug' : 'release';
    final String type = log.type == 'FAIL' ? 'Error' : 'Message';
    String userData = '';
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    final String logString = """
<b>${log.date}</b>
$userData
<b>Platform:</b> $platform
<b>File:</b> ${log.file}
<b>$type:</b> ${log.message}
<b>Opened time</b> ${AppPrefs.counter}
<b>Version</b> <a href = "$versionUrl">$version $buildNumber $mode</a>
""";
    return logString;
  }

  static Future sendFromStorage() async {
    Box<LogModel> box = HiveBoxes.logBox;
    if (box.isEmpty) return;

    box.values.toList().reversed.toList().forEach((log) async {
      await _sendToTelegram(log).then((value) async {
        if (value.isSuccess) {
          await log.delete();
        }
      });
    });
  }
}

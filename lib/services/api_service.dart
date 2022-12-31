import 'package:yaaseen/services/http_result.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart' as pp;

class ApiService {
  static Future<HttpResult> sendFeedback(String message) async {
    Uri url = Uri.parse('DotEnv.telegramLink + message');
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        return HttpResult(
          isSuccess: true,
          statusCode: 200,
          response: response.body,
        );
      }
      return HttpResult(
        statusCode: response.statusCode,
        response: response.body,
      );
    } catch (err) {
      return HttpResult(statusCode: 1000, response: err.toString());
    }
  }

  static Future<String> downloadFiles(String uri) async {
    try {
      Uri url = Uri.parse(uri);
      final fileName = uri.split('/').last;
      Directory? directory;

      if (Platform.isAndroid) {
        directory = await pp.getExternalStorageDirectory();
      } else {
        directory = await pp.getApplicationDocumentsDirectory();
      }

      final String filePath = '${directory?.path}/$fileName';
      File file = File(filePath);
      bool exists = await file.exists();

      /// Checking if the file exists in the local storage. If it does, it returns the file path.
      if (exists) {
        return filePath;
      }

      final request = await HttpClient().getUrl(url);
      final response = await request.close();

      await response.pipe(file.openWrite());
      return filePath;
    } catch (err) {
      throw Exception('Not downloaded');
    }
  }
}

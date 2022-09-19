import 'package:yaaseen/core/core.dart';
import 'package:yaaseen/services/http_result.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<HttpResult> sendFeedback(String message) async {
    Uri url = Uri.parse(AppSecure.TELEGRAM_BOT_LINK + message);
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
}

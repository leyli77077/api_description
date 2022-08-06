import 'package:http/http.dart' as http;

class ApiData {
  static Map<String, String> get headers => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $accessToken', 
      };

  static String? accessToken;

  static Future<http.Response> get(Uri url) {
    return http.get(
      url,
      headers: headers,
    );
  }

  static Future<http.Response> post(Uri url, {Object? body}) {
    return http.post(
      url,
      headers: headers,
      body: body,
    );
  }
}

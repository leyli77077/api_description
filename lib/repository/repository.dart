import 'package:http/http.dart' as http;

class Repository {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';

  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/category'));
  }
}

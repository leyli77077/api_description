import 'package:http/http.dart'as http;
class ProductDetailService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';
  httpGet() async {
    return await http
        .get(Uri.parse('${_baseUrl}customers/product/detail?id=3033'));
  }
}

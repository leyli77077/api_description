import 'package:http/http.dart' as http;

class FeautureProductService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';

  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/product/feature-product?slug=baby-care'));
  }
}
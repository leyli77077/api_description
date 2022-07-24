import 'dart:convert';

import 'package:flutter_shop/models/product_detail.dart';
import 'package:http/http.dart'as http;
class ProductDetailService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';
  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/product/detail?id=3033'));
  }
Future<List<ProductDetail>> loadProductDetail() async {
    http.Response response =
        await http.get(Uri.parse('${_baseUrl}customers/product/detail?id=3033'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => ProductDetail.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }

}

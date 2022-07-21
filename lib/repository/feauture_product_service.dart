import 'dart:convert';

import 'package:flutter_shop/models/feauture_product.dart';
import 'package:http/http.dart' as http;

class FeautureProductService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';

  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/product/feature-product?slug=baby-care'));
  }

  Future<List<FeautureProduct>> loadFeatureProduct() async {
    http.Response response =
        await http.get(Uri.parse('${_baseUrl}customers/product/feature-product?slug=baby-care'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => FeautureProduct.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}
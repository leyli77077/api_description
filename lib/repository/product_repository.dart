import 'dart:convert';

import 'package:flutter_shop/constants/app_constants.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  httpGet() async {
    return await http.get(Uri.parse(
        '${AppConstants.currentHost}customers/product/feature-product?slug=baby-care'));
  }

  Future<List<FeautureProduct>> loadFeatureProduct() async {
    http.Response response = await http.get(Uri.parse(
        '${AppConstants.currentHost}customers/product/feature-product?slug=baby-care'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => FeautureProduct.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }

  getdetail(int id) async {
    return await http.get(Uri.parse(
        '${AppConstants.currentHost}customers/product/detail?id=$id'));
  }
}

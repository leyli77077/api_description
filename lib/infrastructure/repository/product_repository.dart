import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/product.dart';
import 'package:flutter_shop/domain/product_detail.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class ProductRepository {
  Future<List<Product>> loadFeatureProduct() async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/product/feature-product?slug=baby-care'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  Future<ProductDetail> loadProductDetail(int id) async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/product/detail?id=$id'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      dynamic data = result['data'];
      return ProductDetail.fromJson(data);
    } else {
      throw Exception();
    }
  }
}

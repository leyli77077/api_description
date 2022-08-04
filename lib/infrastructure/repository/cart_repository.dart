import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/cart/cart.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class CartRepository {
  static Future<Cart> initRequest() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/'),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']);
    } else {
      throw Exception();
    }
  }

  static Future<Cart> update({
    required int productId,
    required int quantity,
  }) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/update'),
      body: jsonEncode({
        'product_id': productId,
        'quantity': quantity,
      }),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']);
    } else {
      throw Exception();
    }
  }

  static Future<Cart> flush() async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/flush'),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']);
    } else {
      throw Exception();
    }
  }
}

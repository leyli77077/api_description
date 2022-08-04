import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/cart/cart.dart';
import 'package:flutter_shop/infrastructure/repository/auth_repository.dart';
import 'package:http/http.dart' as http;

class CartRepository {
  static Future<Cart> initRequest() async {
    http.Response response = await http.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/'),
      headers: AuthRepository.headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/update'),
      headers: AuthRepository.headers(),
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
    var response = await http.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/flush'),
      headers: AuthRepository.headers(),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']);
    } else {
      throw Exception();
    }
  }
}

import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/cart/cart.dart';
import 'package:flutter_shop/domain/cart/summary.dart';
import 'package:flutter_shop/domain/order/order.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class OrderRepository {
  static Future<Cart> loadCart() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/'),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']['cart']);
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
      return Cart.fromMap(decoded['data']['cart']);
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
      return Cart.fromMap(decoded['data']['cart']);
    } else {
      throw Exception();
    }
  }

  static Future<Summary> summary() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/summary'),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Summary.fromMap(decoded['data']['summary']);
    } else {
      throw Exception();
    }
  }

  static Future<bool> complete({
    required String address,
    required String title,
    required String description,
  }) async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/complete'),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Order>> orderList({
    int page = 0,
    int perPage = 10,
  }) async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/cart/complete'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Order.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<Cart> orderDetail(int id) async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/order/detail/$id'),
    );
    if (response.statusCode == 200) {
      dynamic decoded = jsonDecode(response.body);
      return Cart.fromMap(decoded['data']);
    } else {
      throw Exception();
    }
  }
}

import 'dart:convert';

import '../../core/constants/app_constants.dart';
import '../../domain/product/product.dart';
import '../../domain/product/product_detail.dart';
import '../data/api_data.dart';

class ProductRepository {
  static Future<List<Product>> loadFeatureProduct() async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/product/feature-product?slug=baby-care'));
    var result = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> loadRelatedProduct(
      {required String slug}) async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/product/related?slug=$slug'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> productList({
    required String slug,
    int page = 0,
    int perPage = 10,
  }) async {
    var response = await ApiData.get(
      Uri.parse(
          '${AppConstants.currentHost}/api/customers/product/list?slug=$slug&page=$page&per_page=$perPage'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> productListByBrand({
    required int brandId,
    int page = 0,
    int perPage = 10,
  }) async {
    var response = await ApiData.get(
      Uri.parse(
          '${AppConstants.currentHost}/api/customers/product/list?brand_id=$brandId&page=$page&per_page=$perPage'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> productSearch({
    required String searched,
    int page = 0,
    int perPage = 10,
  }) async {
    var response = await ApiData.get(
      Uri.parse(
          '${AppConstants.currentHost}/api/customers/search?q=$searched&page=$page&per_page=$perPage'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<ProductDetail> loadProductDetail(int id) async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/product/detail?id=$id'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      dynamic data = result['data']['detail'];
      return ProductDetail.fromMap(data);
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> loadFavorites({
    int page = 0,
    int perPage = 10,
  }) async {
    var response = await ApiData.get(
      Uri.parse(
          '${AppConstants.currentHost}/api/customers/favorite/list?page=$page&per_page=$perPage'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<bool> addFavorite(int id) async {
    var response = await ApiData.post(
      Uri.parse('${AppConstants.currentHost}/api/customers/favorite'),
      body: jsonEncode(
        {
          'product_id': id,
        },
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw false;
    }
  }
}

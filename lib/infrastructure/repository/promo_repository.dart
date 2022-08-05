import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/product/product.dart';
import 'package:flutter_shop/domain/promo/promo_banner_detail.dart';
import 'package:flutter_shop/domain/promo/promo_banner.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class PromoRepository {
  static Future<List<PromoBanner>> loadBanners() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/promo/banners'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => PromoBanner.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<PromoBannerDetail>> loadList() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/promo/banners'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => PromoBannerDetail.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }

  static Future<PromoBannerDetail> fetch() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/promo/banners'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      return PromoBannerDetail.fromMap(result['data']);
    } else {
      throw Exception();
    }
  }

  static Future<List<Product>> productItems({required int id}) async {
    var response = await ApiData.get(Uri.parse(
        '${AppConstants.currentHost}/api/customers/promo/items?id=$id'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data']['items'];
      return data.map((e) => Product.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }
}

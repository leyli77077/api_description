import 'dart:convert';

import 'package:flutter_shop/constants/app_constants.dart';
import 'package:flutter_shop/models/promo_banner.dart';
import 'package:http/http.dart' as http;

class BannerRepository {
  httpGet() async {
    return await http
        .get(Uri.parse('${AppConstants.currentHost}customers/promo/banners'));
  }

  Future<List<PromoBanner>> loadBanners() async {
    http.Response response = await http
        .get(Uri.parse('${AppConstants.currentHost}customers/promo/banners'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => PromoBanner.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}
import 'dart:convert';

import 'package:flutter_shop/models/promo_banner.dart';
import 'package:http/http.dart' as http;

class PromoBannerService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';

  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/promo/banners'));
  }

  Future<List<PromoBanner>> loadBanners() async {
    http.Response response =
        await http.get(Uri.parse('${_baseUrl}customers/promo/banners'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => PromoBanner.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}

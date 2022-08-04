import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/promo_banner.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class BannerRepository {
  Future<List<PromoBanner>> loadBanners() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/promo/banners'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => PromoBanner.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}

import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/brand_list.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class BrandRepository {
  static Future<List<Brand>> loadBrandLists() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/brand'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data']['brands'];
      return data.map((e) => Brand.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }
}

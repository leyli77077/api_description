import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/brand_list.dart';
import 'package:http/http.dart' as http;

class BrandRepository {
  Future<List<BrandList>> loadBrandLists() async {
    http.Response response = await http
        .get(Uri.parse('${AppConstants.currentHost}/api/customers/brand'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data']['brands'];
      return data.map((e) => BrandList.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}

import 'dart:convert';

import 'package:flutter_shop/core/constants/app_constants.dart';
import 'package:flutter_shop/domain/category.dart';
import 'package:flutter_shop/infrastructure/data/api_data.dart';

class CategoryRepository {
  Future<List<Category>> loadCategories() async {
    var response = await ApiData.get(
      Uri.parse('${AppConstants.currentHost}/api/customers/category'),
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Category.fromMap(e)).toList();
    } else {
      throw Exception();
    }
  }
}

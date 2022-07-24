import 'dart:convert';

import 'package:flutter_shop/constants/app_constants.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:http/http.dart' as http;

class CategoryRepository {
  httpGet() async {
    return await http
        .get(Uri.parse('${AppConstants.currentHost}customers/category'));
  }

  Future<List<Category>> loadCategories() async {
    http.Response response = await http
        .get(Uri.parse('${AppConstants.currentHost}customers/category'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => Category.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}

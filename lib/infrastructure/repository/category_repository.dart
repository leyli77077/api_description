import 'dart:convert';

import '../../core/constants/app_constants.dart';
import '../../domain/category.dart';
import '../data/api_data.dart';

class CategoryRepository {
  static Future<List<Category>> loadCategories() async {
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

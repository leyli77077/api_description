import 'dart:convert';

import '../../core/constants/app_constants.dart';
import '../../domain/brand_list.dart';
import '../data/api_data.dart';

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

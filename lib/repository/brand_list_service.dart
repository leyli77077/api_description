import 'dart:convert';

import 'package:flutter_shop/models/brand_list.dart';
import 'package:http/http.dart' as http;

class BrandListService {
  final String _baseUrl = 'http://shop.asmantiz.com/api/';

  httpGet() async {
    return await http.get(Uri.parse('${_baseUrl}customers/brand'));
  }

  Future<List<BrandList>> loadBrandLists() async {
    http.Response response =
        await http.get(Uri.parse('${_baseUrl}customers/brand'));
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      List data = result['data'];
      return data.map((e) => BrandList.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  }
}

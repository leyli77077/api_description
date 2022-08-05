import 'package:flutter/foundation.dart';
import 'package:flutter_shop/domain/product/product_detail.dart';
import 'package:flutter_shop/infrastructure/repository/product_repository.dart';

class ProductService extends ChangeNotifier {
  static Future<ProductDetail> loadProductDetail(int id) =>
      ProductRepository.loadProductDetail(id);
}

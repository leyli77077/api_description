import 'package:flutter_shop/core/parsers.dart';

class ProductDetail {
  final int id;
  final String code;
  final double price;
  final String priceText;
  final double? struckPrice;
  final String? struckPriceText;
  final String name;
  final String shortDescription;
  final String details;
  final int? saleLimitQuantity;
  final bool isBundle;
  final bool isFavorite;
  final String pics;

  const ProductDetail({
    required this.id,
    required this.code,
    required this.price,
    required this.priceText,
    required this.struckPrice,
    required this.struckPriceText,
    required this.name,
    required this.shortDescription,
    required this.details,
    required this.saleLimitQuantity,
    required this.isBundle,
    required this.isFavorite,
    required this.pics,
  });
  factory ProductDetail.fromMap(Map<String, dynamic> map) {
    return ProductDetail(
      id: intParser(map['id']) ?? 0,
      code: map['code'] ?? '',
      price: doubleParser('${map['price']}') ?? 0,
      priceText: map['price_text'] ?? '',
      struckPrice: map['struck_price'],
      struckPriceText: map['struck_price_text'],
      name: map['name'] ?? '',
      shortDescription: map['short_description'] ?? '',
      details: map['details'] ?? '',
      saleLimitQuantity: map['sale_limit_quantity'],
      isBundle: map['is_bundle'] ?? false,
      isFavorite: map['is_favorite'] ?? false,
      pics: map['pics'] ?? '',
    );
  }
}

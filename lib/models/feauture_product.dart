import 'package:flutter_shop/core/parsers.dart';

class FeautureProduct {
  final int id;
  final double price;
  final String code;
  final String priceText;
  final double? struckPrice;
  final String? struckPriceText;
  final String shortName;
  final String shortDescription;
  final int saleLimitQuantity;
  final bool isBundle;
  final String thumbPic;

  const FeautureProduct({
    required this.id,
    required this.price,
    required this.code,
    required this.priceText,
    required this.struckPrice,
    required this.struckPriceText,
    required this.shortName,
    required this.shortDescription,
    required this.saleLimitQuantity,
    required this.isBundle,
    required this.thumbPic,
  });

  factory FeautureProduct.fromJson(Map<String, dynamic> json) {
    return FeautureProduct(
      id: json["id"] ?? 0,
      code: json["code"],
      price: double.tryParse('${json["price"]}') ?? 0.0,
      priceText: json["price_text"],
      struckPrice: doubleParser(json["struck_price"]),
      struckPriceText: json["struck_price_text"],
      shortName: json["short_name"],
      shortDescription: json["short_description"],
      saleLimitQuantity: json["sale_limit_quantity"] ?? 0,
      isBundle: json["is_bundle"],
      thumbPic: json["thumb_pic"],
    );
  }
}

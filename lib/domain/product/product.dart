import 'package:flutter_shop/core/parsers.dart';

class Product {
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
  Product({
    required this.id,
    required this.price,
    required this.code,
    required this.priceText,
    this.struckPrice,
    this.struckPriceText,
    required this.shortName,
    required this.shortDescription,
    required this.saleLimitQuantity,
    required this.isBundle,
    required this.thumbPic,
  });

  Product copyWith({
    int? id,
    double? price,
    String? code,
    String? priceText,
    double? struckPrice,
    String? struckPriceText,
    String? shortName,
    String? shortDescription,
    int? saleLimitQuantity,
    bool? isBundle,
    String? thumbPic,
  }) {
    return Product(
      id: id ?? this.id,
      price: price ?? this.price,
      code: code ?? this.code,
      priceText: priceText ?? this.priceText,
      struckPrice: struckPrice ?? this.struckPrice,
      struckPriceText: struckPriceText ?? this.struckPriceText,
      shortName: shortName ?? this.shortName,
      shortDescription: shortDescription ?? this.shortDescription,
      saleLimitQuantity: saleLimitQuantity ?? this.saleLimitQuantity,
      isBundle: isBundle ?? this.isBundle,
      thumbPic: thumbPic ?? this.thumbPic,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'code': code,
      'price_text': priceText,
      'struck_price': struckPrice,
      'struck_price_text': struckPriceText,
      'short_name': shortName,
      'short_description': shortDescription,
      'sale_limit_quantity': saleLimitQuantity,
      'is_bundle': isBundle,
      'thumb_pic': thumbPic,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: intParser(map['id']) ?? 0,
      price: doubleParser(map['price']) ?? 0.0,
      code: map['code'] ?? '',
      priceText: map['price_text'] ?? '',
      struckPrice: doubleParser(map['struck_price']),
      struckPriceText: map['struck_price_text'],
      shortName: map['short_name'] ?? '',
      shortDescription: map['short_description'] ?? '',
      saleLimitQuantity: intParser(map['sale_limit_quantity']) ?? 0,
      isBundle: map['is_bundle'] ?? false,
      thumbPic: map['thumb_pic'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product && other.id == id;
  }

  @override
  int get hashCode {
    return id.hashCode;
  }
}

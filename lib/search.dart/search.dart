import '../../core/parsers.dart';

class SearchProduct {
  final int id;
  final String code;
  final double price;
  final String priceText;
  final double? struckPrice;
  final String? struckPriceText;
  final String shortName;
  final int saleLimitQuantity;
  final bool isBundle;
  final String thumbPic;
  SearchProduct({
    required this.id,
    required this.code,
    required this.price,
    required this.priceText,
    this.struckPrice,
    this.struckPriceText,
    required this.shortName,
    required this.saleLimitQuantity,
    required this.isBundle,
    required this.thumbPic,
  });

  SearchProduct copyWith({
    int? id,
    String? code,
    double? price,
    String? priceText,
    double? struckPrice,
    String? struckPriceText,
    String? shortName,
    int? saleLimitQuantity,
    bool? isBundle,
    String? thumbPic,
  }) {
    return SearchProduct(
      id: id ?? this.id,
      price: price ?? this.price,
      code: code ?? this.code,
      priceText: priceText ?? this.priceText,
      struckPrice: struckPrice ?? this.struckPrice,
      struckPriceText: struckPriceText ?? this.struckPriceText,
      shortName: shortName ?? this.shortName,
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
      'sale_limit_quantity': saleLimitQuantity,
      'is_bundle': isBundle,
      'thumb_pic': thumbPic,
    };
  }

  factory SearchProduct.fromMap(Map<String, dynamic> map) {
    return SearchProduct(
      id: intParser(map['id']) ?? 0,
      price: doubleParser(map['price']) ?? 0.0,
      code: map['code'] ?? '',
      priceText: map['price_text'] ?? '',
      struckPrice: doubleParser(map['struck_price']),
      struckPriceText: map['struck_price_text'],
      shortName: map['short_name'] ?? '',
      saleLimitQuantity: intParser(map['sale_limit_quantity']) ?? 0,
      isBundle: map['is_bundle'] ?? false,
      thumbPic: map['thumb_pic'] ?? '',
    );
  }

  static fromJson(e) {}
}

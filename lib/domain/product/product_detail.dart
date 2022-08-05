class ProductDetail {
  final int id;
  final String code;
  final double price;
  final String priceText;
  final dynamic struckPrice;
  final dynamic struckPriceText;
  final String name;
  final String shortDescription;
  final dynamic details;
  final dynamic saleLimitQuantity;
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
  factory ProductDetail.fromMap(Map<String, dynamic> json) {
    return ProductDetail(
      id: json["id"],
      code: json["code"],
      price: double.tryParse('${json["price"]}') ?? 0,
      priceText: json["price_text"],
      struckPrice: json["struck_price"],
      struckPriceText: json["struck_price_text"],
      name: json["name"],
      shortDescription: json["short_description"],
      details: json["details"],
      saleLimitQuantity: json["sale_limit_quantity"],
      isBundle: json["is_bundle"],
      isFavorite: json["is_favorite"],
      pics: json["pics"],
    );
  }
}

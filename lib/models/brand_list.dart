class BrandList {
  final int id;
  final String code;
  final String name;
  final String media;
  final dynamic productsCount;

  const BrandList({
    required this.id,
    required this.code,
    required this.name,
    required this.media,
    required this.productsCount,
  });

  factory BrandList.fromJson(Map<String, dynamic> json) {
    return BrandList(
      id: json['id'],
      code: json['code'],
      name: json['name'],
      media: json['media'],
      productsCount: json['products_count'],
    );
  }
}

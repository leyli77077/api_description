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

  factory BrandList.fromMap(Map<String, dynamic> json) {
    return BrandList(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? json['attribute'],
      media: json['media'] ?? '',
      productsCount: json['products_count'] ?? 0,
    );
  }
}

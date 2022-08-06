class Brand {
  final int id;
  final String code;
  final String name;
  final String media;
  final dynamic productsCount;

  const Brand({
    required this.id,
    required this.code,
    required this.name,
    required this.media,
    required this.productsCount,
  });

  factory Brand.fromMap(Map<String, dynamic> json) {
    return Brand(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? json['attribute'],
      media: json['media'] ?? '',
      productsCount: json['products_count'] ?? 0,
    );
  }
}

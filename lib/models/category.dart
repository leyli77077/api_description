class Category {
  final int? parentId;
  final int id;
  final String slug;
  final String name;
  final int? childrenCount;
  final int? productsCount;
  final String? thumbImage;

  const Category({
    required this.parentId,
    required this.id,
    required this.name,
    required this.slug,
    required this.childrenCount,
    required this.productsCount,
    required this.thumbImage,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      parentId: json['parent_id'],
      id: json['id'],
      name: json['name'],
      slug: json['slug'],
      childrenCount: json['children_count'],
      productsCount: json['products_count'],
      thumbImage: json['thumb_image'],
    );
  }
}

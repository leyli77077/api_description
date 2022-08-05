import 'package:flutter_shop/domain/product/product.dart';

class CartLine {
  final int id;
  final int quantity;
  final double discountTotal;
  final String discountTotalText;
  final double total;
  final String totalText;
  final Product product;
  CartLine({
    required this.id,
    required this.quantity,
    required this.discountTotal,
    required this.discountTotalText,
    required this.total,
    required this.totalText,
    required this.product,
  });

  CartLine copyWith({
    int? id,
    int? quantity,
    double? discountTotal,
    String? discountTotalText,
    double? total,
    String? totalText,
    Product? product,
  }) {
    return CartLine(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      discountTotal: discountTotal ?? this.discountTotal,
      discountTotalText: discountTotalText ?? this.discountTotalText,
      total: total ?? this.total,
      totalText: totalText ?? this.totalText,
      product: product ?? this.product,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'discount_total': discountTotal,
      'discount_total_text': discountTotalText,
      'total': total,
      'total_text': totalText,
      'product': product.toMap(),
    };
  }

  factory CartLine.fromMap(Map<String, dynamic> map) {
    return CartLine(
      id: map['id']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      discountTotal: map['discount_total']?.toDouble() ?? 0.0,
      discountTotalText: map['discount_total_text'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      totalText: map['total_text'] ?? '',
      product: Product.fromMap(map['product']),
    );
  }
}

import 'cart_line.dart';

class Cart {
  final int id;
  final double discountTotal;
  final String discountTotalText;
  final double total;
  final String totalText;
  final String updatedAt;
  final List<CartLine> lines;
  Cart({
    required this.id,
    required this.discountTotal,
    required this.discountTotalText,
    required this.total,
    required this.totalText,
    required this.updatedAt,
    required this.lines,
  });

  Cart copyWith({
    int? id,
    double? discountTotal,
    String? discountTotalText,
    double? total,
    String? totalText,
    String? updatedAt,
    List<CartLine>? lines,
  }) {
    return Cart(
      id: id ?? this.id,
      discountTotal: discountTotal ?? this.discountTotal,
      discountTotalText: discountTotalText ?? this.discountTotalText,
      total: total ?? this.total,
      totalText: totalText ?? this.totalText,
      updatedAt: updatedAt ?? this.updatedAt,
      lines: lines ?? this.lines,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'discount_total': discountTotal,
      'discount_total_text': discountTotalText,
      'total': total,
      'total_text': totalText,
      'updated_at': updatedAt,
      'lines': lines.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id']?.toInt() ?? 0,
      discountTotal: map['discount_total']?.toDouble() ?? 0.0,
      discountTotalText: map['discount_total_text'] ?? '',
      total: map['total']?.toDouble() ?? 0.0,
      totalText: map['total_text'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      lines: map['lines'] != null
          ? List<CartLine>.from(map['lines']?.map((x) => CartLine.fromMap(x)))
          : [],
    );
  }
}

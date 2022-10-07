import '../../core/parsers.dart';
import '../cart/cart.dart';

class Order {
  final int id;
  final String reference;
  final String status;
  final String placedAt;
  final double total;
  final String totalText;
  final int linesCount;
  List<Cart>? listItemCart;
  Order({
    required this.id,
    required this.reference,
    required this.status,
    required this.placedAt,
    required this.total,
    required this.totalText,
    required this.linesCount,
  });

  Order copyWith({
    int? id,
    String? reference,
    String? status,
    String? placedAt,
    double? total,
    String? totalText,
    int? linesCount,
  }) {
    return Order(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      status: status ?? this.status,
      placedAt: placedAt ?? this.placedAt,
      total: total ?? this.total,
      totalText: totalText ?? this.totalText,
      linesCount: linesCount ?? this.linesCount,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'reference': reference,
      'status': status,
      'placed_at': placedAt,
      'total': total,
      'total_text': totalText,
      'lines_count': linesCount,
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
      id: intParser(map['id']) ?? 0,
      reference: map['reference'] ?? '',
      status: map['status'] ?? '',
      placedAt: map['placed_at'] ?? '',
      total: doubleParser(map['total']) ?? 0.0,
      totalText: map['total_text'] ?? '',
      linesCount: intParser(map['lines_count']) ?? 0,
    );
  }
}

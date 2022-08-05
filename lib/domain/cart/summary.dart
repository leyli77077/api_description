import 'dart:convert';

class Summary {
  final double total;
  final double subTotal;
  final double discountTotal;
  final double deliveryCost;
  final String totalText;
  final String subTotalText;
  final String discountTotalText;
  final String deliveryCostText;
  Summary({
    required this.total,
    required this.subTotal,
    required this.discountTotal,
    required this.deliveryCost,
    required this.totalText,
    required this.subTotalText,
    required this.discountTotalText,
    required this.deliveryCostText,
  });

  Summary copyWith({
    double? total,
    double? subTotal,
    double? discountTotal,
    double? deliveryCost,
    String? totalText,
    String? subTotalText,
    String? discountTotalText,
    String? deliveryCostText,
  }) {
    return Summary(
      total: total ?? this.total,
      subTotal: subTotal ?? this.subTotal,
      discountTotal: discountTotal ?? this.discountTotal,
      deliveryCost: deliveryCost ?? this.deliveryCost,
      totalText: totalText ?? this.totalText,
      subTotalText: subTotalText ?? this.subTotalText,
      discountTotalText: discountTotalText ?? this.discountTotalText,
      deliveryCostText: deliveryCostText ?? this.deliveryCostText,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'sub_total': subTotal,
      'discount_total': discountTotal,
      'delivery_cost': deliveryCost,
      'total_text': totalText,
      'sub_total_text': subTotalText,
      'discount_total_text': discountTotalText,
      'delivery_cost_text': deliveryCostText,
    };
  }

  factory Summary.fromMap(Map<String, dynamic> map) {
    return Summary(
      total: map['total']?.toDouble() ?? 0.0,
      subTotal: map['sub_total']?.toDouble() ?? 0.0,
      discountTotal: map['discount_total']?.toDouble() ?? 0.0,
      deliveryCost: map['delivery_cost']?.toDouble() ?? 0.0,
      totalText: map['total_text'] ?? '',
      subTotalText: map['sub_total_text'] ?? '',
      discountTotalText: map['discount_total_text'] ?? '',
      deliveryCostText: map['delivery_cost_text'] ?? '',
    );
  }
}

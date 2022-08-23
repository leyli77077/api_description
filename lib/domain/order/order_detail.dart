import '../../core/parsers.dart';

class OrderDetail{
 final int id;
  final int productId;
  final int productCode;
  final String thumbPic;
  final double quantity;
   final String shortName;
   final double total;
   final String totalText;
  OrderDetail({
    required this.id,
    required this.productId,
    required this.productCode,
    required this.thumbPic,
    required this.quantity,
    required this.shortName,
    required this.total,
    required this.totalText,
  });
  factory OrderDetail.fromMap(Map<String, dynamic> map) {
    return OrderDetail(
      id: intParser(map['id']) ?? 0,
      productId: map['product_id'] ?? '',
      productCode: map['product_code'] ??'',
      thumbPic: map['thumb_pic'] ?? '',
      quantity: doubleParser(map['quantity']) ?? 0.0,
      shortName: map['short_name'] ?? '',
      total: doubleParser(map['total']) ?? 0.0,
      totalText: map['total_text'] ?? '',
     
    );
  }
}

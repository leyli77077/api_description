import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'package:flutter_shop/models/product_detail.dart';

class HomeProductDetail extends StatelessWidget {
  final ProductDetail productDetail;

  const HomeProductDetail({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(16),
          child: Image.asset(productDetail.pics),)
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../domain/product/product.dart';
import 'product.dart';
import 'product_loading.dart';

class FirstFeaturedWidget extends StatelessWidget {
  final Product? product;
  final bool isEmpty;
  const FirstFeaturedWidget({
    Key? key,
    required this.product,
    required this.isEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (product != null && !isEmpty) {
      return ProductWidget(
        product: product!,
      );
    } else if (isEmpty) {
      return const SizedBox.shrink();
    } else {
      return const ProductLoadingWidget();
    }
  }
}

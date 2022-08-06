import 'package:flutter/material.dart';
import 'package:flutter_shop/domain/product/product.dart';
import 'package:flutter_shop/presentation/widgets/product/product.dart';
import 'package:flutter_shop/presentation/widgets/product/product_loading.dart';

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

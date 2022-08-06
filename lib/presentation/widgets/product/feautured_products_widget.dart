import 'package:flutter/material.dart';
import 'package:flutter_shop/domain/product/product.dart';
import 'package:flutter_shop/presentation/widgets/product/product_loading.dart';
import 'product.dart';

class FeauturedProductsWidget extends StatelessWidget {
  final List<Product>? feautureProductList;
  const FeauturedProductsWidget({Key? key, required this.feautureProductList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (feautureProductList != null && feautureProductList!.isNotEmpty) {
      return SliverPadding(
        padding: const EdgeInsets.all(16.0),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 0.63,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return ProductWidget(
                product: feautureProductList![index],
              );
            },
            childCount: feautureProductList!.length,
          ),
        ),
      );
    }
    if (feautureProductList != null && feautureProductList!.isEmpty) {
      return const SliverToBoxAdapter(
        child: SizedBox.shrink(),
      );
    }
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 10,
          crossAxisSpacing: 13,
          childAspectRatio: 0.63,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return const ProductLoadingWidget();
          },
          childCount: 6,
        ),
      ),
    );
  }
}

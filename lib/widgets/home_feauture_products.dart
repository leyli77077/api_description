import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'home_feauture_product.dart';

class HomeFeautureProducts extends StatelessWidget {
  final List<FeautureProduct> feautureProductList;
  const HomeFeautureProducts({Key? key, required this.feautureProductList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
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
            return HomeFeautureProduct(
              product: feautureProductList[index],
            );
          },
          childCount: feautureProductList.length,
        ),
      ),
    );
  }
}

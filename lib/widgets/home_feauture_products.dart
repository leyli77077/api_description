import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'home_feauture_product.dart';

class HomeFeautureProducts extends StatelessWidget {
  final List<FeautureProduct> feautureProductList;
  HomeFeautureProducts({required this.feautureProductList});
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 13,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HomeFeautureProduct(
            feautureProductId: feautureProductList[index].id,
            feautureProductThumbPic: feautureProductList[index].thumbPic,
            feautureProductPrice: feautureProductList[index].price,
            feautureProductShortDescription:
                feautureProductList[index].shortDescription,
            feautureProductShortName: feautureProductList[index].shortName,
            feautureProductStruckPrice: feautureProductList[index].struckPrice,
          );
        },
        childCount: feautureProductList.length,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'home_feauture_product.dart';

class HomeFeautureProducts extends StatelessWidget {
  final List<FeautureProduct> feautureProductList;
  HomeFeautureProducts({required this.feautureProductList});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: feautureProductList.length,
        itemBuilder: (context, index) {
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
      ),
    );
  }
}

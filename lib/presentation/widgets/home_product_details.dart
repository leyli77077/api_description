import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/domain/product/product_detail.dart';
import 'package:flutter_shop/presentation/widgets/home_product_datail.dart';

class ProductDetails extends StatelessWidget {
  final List<ProductDetail> productDetailList;
  const ProductDetails({Key? key, required this.productDetailList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: productDetailList.length,
        itemBuilder: (context, index) {
          return HomeProductDetail(
            detail: productDetailList[index],
          );
        },
      ),
    );
  }
}

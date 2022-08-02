// import 'package:flutter/cupertino.dart';
// import 'package:flutter_shop/widgets/home_product_datail.dart';

// import '../models/product_detail.dart';

// class ProductDetails extends StatelessWidget {
//   final List<ProductDetails> productDetailList;
//   const ProductDetails({Key? key, required this.productDetailList})
//       : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 140,
//       padding: const EdgeInsets.only(right: 10),
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         physics: const BouncingScrollPhysics(),
//         itemCount: productDetailList.length,
//         itemBuilder: (context, index) {
//           return HomeProductDetail(
//             productDetailId: productDetailList[index].id,
//             productDetailPics: productDetailList[index].pics,
//             productDetailPrice:  productDetailList[index].price,
//              productDetailpriceText:  productDetailList[index].priceText,
//               productDetailStruckPrice:  productDetailList[index].struckPrice,
//                productDetailStruckPriceText:  productDetailList[index].struckPriceText,
//                 productDetailName:  productDetailList[index].name,
//           );
//         },
//       ),
//     );
//   }
// }
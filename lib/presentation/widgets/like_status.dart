// import 'package:flutter/material.dart';
// import 'package:flutter_shop/domain/product/product_detail.dart';
// import 'package:provider/provider.dart';

// import '../../infrastructure/repository/auth_repository.dart';

// class LikeStatus extends StatelessWidget {
//   final ProductDetail productDeatail;
//   const LikeStatus({Key? key, required this.productDeatail}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<AuthRepository>(
//       builder: (context, value, child) => IconButton(
//         onPressed: () async {
//           try {
//             productDeatail.toggleFavourites(productDeatail.id.toString(), value.token, value.userId);
//           } catch (error) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(const SnackBar(content: Text("Error Occurred")));
//           }
//           ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               duration: const Duration(milliseconds: 800),
//               content: Text(
//                 productDeatail.isFavorite
//                     ? "${productDeatail.name} added to favourites"
//                     : "${productDeatail.name} removed from favourites",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           );
//         },
//         icon: Icon(
//           productDeatail.isFavorite ? Icons.favorite : Icons.favorite_outline,
//           color: productDeatail.isFavorite ? Colors.red : null,
//         ),
//       ),
//     );
//   }
// }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeFeautureProduct extends StatelessWidget {
  final int? feautureProductId;
  final String? feautureProductThumbPic;
  final double? feautureProductPrice;
  final dynamic feautureProductStruckPrice;
  final String? feautureProductShortName;
  final String? feautureProductShortDescription;

  const HomeFeautureProduct(
      {Key? key,
      this.feautureProductId,
      required this.feautureProductThumbPic,
      required this.feautureProductPrice,
      required this.feautureProductShortDescription,
      required this.feautureProductShortName,
      required this.feautureProductStruckPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(feautureProductShortName);
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
        child: CachedNetworkImage(
          imageUrl: feautureProductThumbPic!,
        ));
  }
}

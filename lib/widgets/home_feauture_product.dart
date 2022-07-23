import 'package:flutter/material.dart';
import 'package:flutter_shop/models/feauture_product.dart';

class HomeFeautureProduct extends StatelessWidget {
  final FeautureProduct product;

  const HomeFeautureProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(feautureProductShortName);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset.zero,
                blurRadius: 20.0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 190,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: NetworkImage(product.thumbPic!),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.shortName.toString(),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.shortDescription.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
              // const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.price.toString()),
                  if (product.struckPrice != null)
                    Text(
                      product.struckPrice.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          // prosent
          top: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(5.5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              (product.struckPrice.toString()),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

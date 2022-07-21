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
    // print(feautureProductShortName);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(10.0),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: 190,
                height: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    image: NetworkImage(feautureProductThumbPic!),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  feautureProductShortName.toString(),
                  style: const TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  feautureProductShortDescription.toString(),
                  style: const TextStyle(fontSize: 15, color: Colors.black26),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(feautureProductPrice.toString()),
                  if (feautureProductPrice != null)
                    Text(
                      feautureProductStruckPrice.toString(),
                      style: const TextStyle(
                          fontSize: 15,
                          height: 1.5,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.black),
                    ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          // prosent
          top: 30,
          left: 16,
          child: Container(
            padding: const EdgeInsets.all(5.5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            child: Text(
              (feautureProductStruckPrice.toString()),
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

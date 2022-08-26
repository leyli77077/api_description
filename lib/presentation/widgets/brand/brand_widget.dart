import 'package:flutter/material.dart';
import '../../../domain/brand_list.dart';

class BrandWidget extends StatelessWidget {
  final Brand brand;

  const BrandWidget({
    Key? key,
    required this.brand,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(feautureProductShortName);
    return Container(
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
                image: NetworkImage(brand.media),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              brand.name.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12, color: Colors.black26),
            ),
          ),
        ],
      ),
    );
  }
}

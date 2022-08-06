import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BrandLoadingWidget extends StatelessWidget {
  const BrandLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.grey.shade400,
      child: Container(
        height: 172,
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
      ),
    );
  }
}

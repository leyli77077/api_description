import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryLoadingWidget extends StatelessWidget {
  const CategoryLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade400,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            5,
            (index) => SizedBox(
              width: 130,
              height: 130,
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 12,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

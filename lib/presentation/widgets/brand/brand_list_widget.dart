import 'package:flutter/material.dart';
import 'package:flutter_shop/domain/brand_list.dart';
import 'package:flutter_shop/presentation/widgets/brand/brand_loading.dart';
import 'package:flutter_shop/presentation/widgets/brand/brand_widget.dart';

class BrandListWidget extends StatelessWidget {
  final List<Brand>? brandList;
  const BrandListWidget({Key? key, required this.brandList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (brandList != null && brandList!.isNotEmpty) {
      return SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 0.7,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return BrandWidget(
                brand: brandList![index],
              );
            },
            childCount: brandList!.length,
          ),
        ),
      );
    } else if (brandList != null && brandList!.isEmpty) {
      return const SliverToBoxAdapter();
    } else {
      return SliverPadding(
        padding: const EdgeInsets.all(16),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 13,
            childAspectRatio: 0.7,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return const BrandLoadingWidget();
            },
            childCount: 6,
          ),
        ),
      );
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/models/brand_list.dart';
import 'package:flutter_shop/widgets/home_brand_list.dart';

class HomeBrandLists extends StatelessWidget {
  final List<BrandList> brandList;
  const HomeBrandLists({Key? key, required this.brandList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 13,
        childAspectRatio: 0.7,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return HomeBrandList(
            brandListId: brandList[index].id,
            brandListMedia: brandList[index].media,
            brandListName: brandList[index].name,
          );
        },
        childCount: brandList.length,
      ),
    );
  }
}

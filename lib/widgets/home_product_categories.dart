import 'package:flutter/material.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/widgets/home_product_category.dart';

class HomeProductCategories extends StatelessWidget {
  final List<Category> categoryList;
  const HomeProductCategories({Key? key, required this.categoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        itemBuilder: (context, index) {
          return HomeProductCategory(
            categoryId: categoryList[index].id,
            categoryName: categoryList[index].name,
            categoryThumbImage: categoryList[index].thumbImage!,
          );
        },
      ),
    );
  }
}

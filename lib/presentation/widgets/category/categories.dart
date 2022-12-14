import 'package:flutter/material.dart';
import '../../../domain/category.dart';
import 'category_loading.dart';
import 'category.dart';

class CategoriesWidget extends StatelessWidget {
  final List<Category>? categoryList;
  const CategoriesWidget({Key? key, required this.categoryList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (categoryList != null && categoryList!.isNotEmpty) {
      return SizedBox(
        height: 130,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryList!.length,
          itemBuilder: (context, index) {
            return CategoryWidget(categoryList![index]);
          },
        ),
      );
    } else if (categoryList != null) {
      return const CategoryLoadingWidget();
    } else {
      return const CategoryLoadingWidget();
    }
  }
}

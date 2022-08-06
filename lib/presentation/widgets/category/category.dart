import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/domain/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget(
    this.category, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 130.0,
          height: 130.0,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: category.thumbImage ?? '',
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) => Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, object) {
                  return Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
              const SizedBox(height: 6),
              Text(category.name),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomeProductCategory extends StatelessWidget {
  final int? categoryId;
  final String categoryName;
  final String categoryThumbImage;

  const HomeProductCategory(
      {Key? key,
      this.categoryId,
      required this.categoryName,
      required this.categoryThumbImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SizedBox(
          width: 140.0,
          height: 190.0,
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: categoryThumbImage,
                fit: BoxFit.fitHeight,
                imageBuilder: (context, imageProvider) => Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
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
              Container(),
              Text(categoryName),
            ],
          ),
        ),
      ],
    );
  }
}

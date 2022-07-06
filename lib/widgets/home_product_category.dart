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
    print(categoryThumbImage);
    return Stack(
      children:<Widget>
    [SizedBox(
      width: 140.0,
      height: 190.0,
      child: Column(
        children: [
          // CachedNetworkImage(
          //   imageUrl:
          //       "https://chawkbazar.vercel.app/_next/image?url=%2Fassets%2Fimages%2Fcategory%2Fwatch.jpg&w=256&q=100",
          //   width: 160.0,
          //   height: 160.0,
          // ),

          CircleAvatar(
            radius: 80,
            child: Image.network(
              categoryThumbImage,
              errorBuilder: (context, error, trace) {
                print(error);
                return Text('😢');
              },
            ),
          ),
          Container(),
          Text(categoryName),
        ],
      ),
    ),
    ]);
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HomePromoBanner extends StatelessWidget {
  final int? promoBannerId;
  final String promoBannerpicUrl;

  const HomePromoBanner(
      {Key? key, this.promoBannerId, required this.promoBannerpicUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(promoBannerpicUrl);
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: CachedNetworkImage(
          imageUrl: promoBannerpicUrl,
          imageBuilder: (context, imageProvider) => Material(
            elevation: 8,
            shadowColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
          ),
        ));
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PromoBannerWidget extends StatelessWidget {
  final int? promoBannerId;
  final String promoBannerpicUrl;

  const PromoBannerWidget(
      {Key? key, this.promoBannerId, required this.promoBannerpicUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //print(promoBannerpicUrl);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: CachedNetworkImage(
        imageUrl: promoBannerpicUrl,
        imageBuilder: (context, imageProvider) => Container(
          width: 270,
          height: 140,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 2,
                spreadRadius: 1.5,
                offset: Offset(0, 2.1),
              ),
            ],
          ),
        ),
        errorWidget: (context, url, object) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}

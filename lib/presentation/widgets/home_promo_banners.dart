import 'package:flutter/material.dart';
import 'package:flutter_shop/domain/promo_banner.dart';
import 'package:flutter_shop/presentation/widgets/home_promo_banner.dart';

class HomePromoBanners extends StatelessWidget {
  final List<PromoBanner> promoBannerList;
  const HomePromoBanners({Key? key, required this.promoBannerList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: promoBannerList.length,
        itemBuilder: (context, index) {
          return HomePromoBanner(
            promoBannerId: promoBannerList[index].id,
            promoBannerpicUrl: promoBannerList[index].picUrl,
          );
        },
      ),
    );
  }
}
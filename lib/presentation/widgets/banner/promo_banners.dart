import 'package:flutter/material.dart';
import '../../../domain/promo/promo_banner.dart';
import 'banner_loading.dart';
import 'promo_banner.dart';

class PromoBannersWidget extends StatelessWidget {
  final List<PromoBanner>? promoBannerList;
  const PromoBannersWidget({Key? key, required this.promoBannerList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (promoBannerList != null && promoBannerList!.isNotEmpty) {
      return SizedBox(
        height: 140,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: promoBannerList!.length,
          itemBuilder: (context, index) {
            return PromoBannerWidget(
              promoBannerId: promoBannerList![index].id,
              promoBannerpicUrl: promoBannerList![index].picUrl,
            );
          },
        ),
      );
    } else if (promoBannerList != null && promoBannerList!.isEmpty) {
      return const SizedBox.shrink();
    } else {
      return const BannerLoadingWidget();
    }
  }
}

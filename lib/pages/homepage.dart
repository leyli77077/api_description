import 'package:flutter/material.dart';
import 'package:flutter_shop/application/homepage.dart';
import 'package:flutter_shop/widgets/home_feauture_product.dart';
import 'package:flutter_shop/widgets/home_feauture_products.dart';
import 'package:flutter_shop/widgets/home_product_categories.dart';
import 'package:flutter_shop/widgets/home_promo_banners.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageNotifier, HomePageState>(
      selector: (_, homePage) => homePage.state,
      builder: (_, state, __) {
        if (state is LoadedState) {
          return CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Shop By Category',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: HomeProductCategories(
                  categoryList: state.categoryList,
                ),
              ),
              SliverToBoxAdapter(
                  child:
                      HomePromoBanners(promoBannerList: state.promoBannerList)),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Feautures Product'),
                ),
              ),
              SliverToBoxAdapter(
                child: state.feautureProductList.isNotEmpty
                    ? HomeFeautureProduct(
                        feautureProductId: state.feautureProductList.first.id,
                        feautureProductThumbPic:
                            state.feautureProductList.first.thumbPic,
                        feautureProductPrice:
                            state.feautureProductList.first.price,
                        feautureProductShortDescription:
                            state.feautureProductList.first.shortDescription,
                        feautureProductShortName:
                            state.feautureProductList.first.shortName,
                        feautureProductStruckPrice:
                            state.feautureProductList.first.struckPrice,
                      )
                    : const SizedBox.shrink(),
              ),
              HomeFeautureProducts(
                feautureProductList: state.feautureProductList..skip(0),
              )
            ],
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: IconButton(
              onPressed: () {
                HomePageNotifier.instance.add(LoadEvent());
              },
              icon: const Icon(Icons.refresh),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../../application/home/service.dart';
import '../widgets/brand/brand_list_widget.dart';
import '../widgets/product/feautured_products_widget.dart';
import '../widgets/category/categories.dart';
import '../widgets/banner/promo_banners.dart';
import '../widgets/product/first_featured_product.dart';
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
    return Selector<HomePageService, HomePageState>(
      selector: (_, homePage) => homePage.state,
      builder: (_, state, __) {
        if (state is LoadedState) {
          return RefreshIndicator(
            onRefresh: () async {
              HomePageService.instance.add(LoadEvent());
            },
            child: CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Shop By Category',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CategoriesWidget(
                    categoryList: state.categoryList,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Feautures Product',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(16.0),
                  sliver: SliverToBoxAdapter(
                    child: FirstFeaturedWidget(
                      product: state.feautureProductList?.first,
                      isEmpty: state.feautureProductList != null &&
                          state.feautureProductList!.isEmpty,
                    ),
                  ),
                ),
                FeauturedProductsWidget(
                  feautureProductList: state.feautureProductList?..skip(0),
                ),
                SliverToBoxAdapter(
                  child: PromoBannersWidget(
                    promoBannerList: state.promoBannerList,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text('Top Brands'),
                  ),
                ),
                BrandListWidget(brandList: state.brandList),
              ],
            ),
          );
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: IconButton(
              onPressed: () {
                HomePageService.instance.add(LoadEvent());
              },
              icon: const Icon(Icons.refresh),
            ),
          );
        }
      },
    );
  }
}

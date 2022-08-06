import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_shop/domain/brand_list.dart';
import 'package:flutter_shop/domain/category.dart';
import 'package:flutter_shop/domain/product/product.dart';
import 'package:flutter_shop/domain/promo/promo_banner.dart';
import 'package:flutter_shop/infrastructure/repository/brand_repository.dart';
import 'package:flutter_shop/infrastructure/repository/product_repository.dart';
import 'package:flutter_shop/infrastructure/repository/promo_repository.dart';
import 'package:flutter_shop/infrastructure/repository/category_repository.dart';

part 'event.dart';
part 'state.dart';

class HomePageService extends ChangeNotifier {
  static HomePageService instance = HomePageService._internal();

  factory HomePageService() => instance;

  HomePageService._internal();

  HomePageState _state = EmptyState();

  HomePageState get state => _state;

  void emit(HomePageState state) {
    _state = state;
    notifyListeners();
  }

  void load({
    List<Category>? categoryList,
    List<PromoBanner>? promoBannerList,
    List<Product>? feautureProductList,
    List<Brand>? brandList,
  }) {
    HomePageState now = state;
    if (now is LoadedState) {
      emit(LoadedState(
        categoryList: categoryList ?? now.categoryList,
        feautureProductList: feautureProductList ?? now.feautureProductList,
        promoBannerList: promoBannerList ?? now.promoBannerList,
        brandList: brandList ?? now.brandList,
      ));
    } else {
      emit(LoadedState(
        categoryList: categoryList,
        feautureProductList: feautureProductList,
        promoBannerList: promoBannerList,
        brandList: brandList,
      ));
    }
  }

  void add(HomePageEvent event) async {
    emit(LoadedState());
    try {
      if (event is LoadEvent) {
        Future(() async {
          var categories = await CategoryRepository.loadCategories();
          load(categoryList: categories);
        });
        Future(() async {
          var featuredProducts = await ProductRepository.loadFeatureProduct();
          load(feautureProductList: featuredProducts);
        });
        Future(() async {
          var banners = await PromoRepository.loadBanners();
          load(promoBannerList: banners);
        });
        Future(() async {
          var brandLists = await BrandRepository.loadBrandLists();
          load(brandList: brandLists);
        });
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

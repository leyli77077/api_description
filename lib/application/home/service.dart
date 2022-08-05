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

  void add(HomePageEvent event) async {
    emit(LoadingState());
    try {
      if (event is LoadEvent) {
        var banners = await PromoRepository.loadBanners();
        var categories = await CategoryRepository.loadCategories();
        var featuredProducts = await ProductRepository.loadFeatureProduct();
        var brandLists = await BrandRepository.loadBrandLists();

        emit(LoadedState(
          categoryList: categories,
          feautureProductList: featuredProducts,
          promoBannerList: banners,
          brandList: brandLists,
        ));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

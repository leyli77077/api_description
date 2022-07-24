import 'package:flutter/foundation.dart' hide Category;
import 'package:flutter_shop/models/brand_list.dart';
import 'package:flutter_shop/models/category.dart';
import 'package:flutter_shop/models/feauture_product.dart';
import 'package:flutter_shop/models/promo_banner.dart';
import 'package:flutter_shop/repository/brand_list_service.dart';
import 'package:flutter_shop/repository/feauture_product_service.dart';
import 'package:flutter_shop/repository/promo_banner_service.dart';
import 'package:flutter_shop/repository/repository.dart';

abstract class HomePageEvent {}

class LoadEvent extends HomePageEvent {}

abstract class HomePageState {}

class LoadedState extends HomePageState {
  final List<Category> categoryList;
  final List<PromoBanner> promoBannerList;
  final List<FeautureProduct> feautureProductList;
  final List<BrandList> brandList;
  

  LoadedState({
    required this.categoryList,
    required this.feautureProductList,
    required this.promoBannerList,
    required this.brandList,
  });
}

class EmptyState extends HomePageState {}

class LoadingState extends HomePageState {}

class ErrorState extends HomePageState {
  final String? message;
  ErrorState({this.message});
}

class HomePageNotifier extends ChangeNotifier {
  static HomePageNotifier instance = HomePageNotifier._internal();

  factory HomePageNotifier() => instance;

  HomePageNotifier._internal();

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
        var banners = await PromoBannerService().loadBanners();
        var categories = await Repository().loadCategories();
        var featuredProducts =
            await FeautureProductService().loadFeatureProduct();
        var brandLists = await BrandListService().loadBrandLists();

        emit(LoadedState(
          categoryList: categories,
          feautureProductList: featuredProducts,
          promoBannerList: banners,
          brandList : brandLists,
        ));
      }
    } catch (e) {
      emit(ErrorState(message: e.toString()));
    }
  }
}

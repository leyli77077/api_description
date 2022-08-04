part of 'service.dart';

abstract class HomePageEvent {}

class LoadEvent extends HomePageEvent {}

abstract class HomePageState {}

class LoadedState extends HomePageState {
  final List<Category> categoryList;
  final List<PromoBanner> promoBannerList;
  final List<Product> feautureProductList;
  final List<BrandList> brandList;

  LoadedState({
    required this.categoryList,
    required this.feautureProductList,
    required this.promoBannerList,
    required this.brandList,
  });
}

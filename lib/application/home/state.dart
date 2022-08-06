part of 'service.dart';

abstract class HomePageState {}

class EmptyState extends HomePageState {}

class LoadingState extends HomePageState {}

class ErrorState extends HomePageState {
  final String? message;
  ErrorState({this.message});
}

class LoadedState extends HomePageState {
  final List<Category>? categoryList;
  final List<PromoBanner>? promoBannerList;
  final List<Product>? feautureProductList;
  final List<Brand>? brandList;

  LoadedState({
    this.categoryList,
    this.feautureProductList,
    this.promoBannerList,
    this.brandList,
  });
}

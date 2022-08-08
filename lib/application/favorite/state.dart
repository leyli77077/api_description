part of 'service.dart';

abstract class FavoriteState {}

class EmptyState extends FavoriteState {}

class ErrorState extends FavoriteState {}

class LoadedState extends FavoriteState {
  final List<Product> products;
  LoadedState({required this.products});
}

class LoadingState extends LoadedState {
  LoadingState({required List<Product> products}) : super(products: products);
}

class LastPageState extends LoadedState {
  LastPageState({required List<Product> products}) : super(products: products);
}

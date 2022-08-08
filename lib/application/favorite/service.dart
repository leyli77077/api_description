import 'package:flutter/foundation.dart';
import 'package:flutter_shop/domain/product/product.dart';
import 'package:flutter_shop/infrastructure/repository/product_repository.dart';

part 'event.dart';
part 'state.dart';

class FavoriteService extends ChangeNotifier {
  static FavoriteService instance = FavoriteService._internal();

  FavoriteService._internal();
  FavoriteState _state = EmptyState();
  FavoriteState get state => _state;

  void emit(FavoriteState newState) {
    _state = newState;
    notifyListeners();
  }

  int page = 1;
  final List<Product> _products = [];

  FavoriteState valueChecker(List<Product> products) {
    if (products.isEmpty && _products.isEmpty) {
      return EmptyState();
    } else if (products.isEmpty && _products.isNotEmpty) {
      return LastPageState(products: _products);
    } else if (products.isNotEmpty) {
      page++;
      return LoadedState(products: _products..addAll(products));
    } else {
      return EmptyState();
    }
  }

  Future add(FavoriteEvent event) async {
    emit(LoadedState(products: _products));
    emit(await mapEventToState(event));
  }

  Future<FavoriteState> mapEventToState(FavoriteEvent event) async {
    if (event is InitEvent) {
      page = 1;
      var products = await ProductRepository.loadFavorites(page: page);
      return valueChecker(products);
    } else if (state is LoadEvent) {
      var products = await ProductRepository.loadFavorites(page: page);
      return valueChecker(products);
    } else if (event is AddEvent) {
      bool result = await ProductRepository.addFavorite(event.id);
      if (result) {
        page = 1;
        var products = await ProductRepository.loadFavorites(page: page);
        return valueChecker(products);
      } else {
        return valueChecker(_products);
      }
    } else {
      return EmptyState();
    }
  }
}

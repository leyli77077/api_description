import 'package:flutter/foundation.dart';
import 'package:flutter_shop/domain/cart/cart.dart';

part 'event.dart';
part 'state.dart';

class CartService extends ChangeNotifier {
  static CartService instnance = CartService._internal();

  CartService._internal();
  factory CartService() => instnance;

  CartState _state = EmptyState();

  CartState get state => _state;

  void emit(CartState newState) {
    _state = newState;
    notifyListeners();
  }

  void add(CartEvent event) {}
}

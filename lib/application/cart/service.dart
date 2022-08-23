import 'package:flutter/foundation.dart';
import 'package:flutter_shop/domain/cart/cart.dart';
import 'package:flutter_shop/domain/cart/cart_line.dart';
import 'package:flutter_shop/infrastructure/repository/order_repository.dart';

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

  void add(CartEvent event) async {
    var current = state;
    emit(LoadingState());
    try {
      if (event is InitEvent) {
        var cart = await OrderRepository.loadCart();
        emit(LoadedState(cart));
      } else if (event is AddEvent && current is LoadedState) {
        bool result = current.cart.lines
            .any((element) => element.product.id == event.productId);
        if (result) {
          CartLine line = current.cart.lines
              .firstWhere((element) => element.product.id == event.productId);
          var cart = await OrderRepository.update(
              productId: event.productId, quantity: line.quantity + 1);
          emit(LoadedState(cart));
        } else {
          var cart = await OrderRepository.update(
              productId: event.productId, quantity: 1);
          emit(LoadedState(cart));
        }
      } else if (event is RemoveEvent && current is LoadedState) {
        bool result = current.cart.lines
            .any((element) => element.product.id == event.productId);
        if (result) {
          CartLine line = current.cart.lines
              .firstWhere((element) => element.product.id == event.productId);
          var cart = await OrderRepository.update(
              productId: event.productId, quantity: line.quantity - 1);
          emit(LoadedState(cart));
        } else {
          emit(current);
        }
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}

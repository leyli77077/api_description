import 'package:flutter/foundation.dart';
import '../../domain/cart/cart.dart';
import '../../domain/cart/cart_line.dart';
import '../../infrastructure/repository/order_repository.dart';

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

  Future<void> add(CartEvent event) async {
    CartState current = state;
    emit(LoadingState());
    try {
      if (event is InitEvent) {
        Cart cart = await OrderRepository.loadCart();
        emit(LoadedState(cart));
      } else if (event is AddEvent && current is LoadedState) {
        bool result = current.cart.lines
            .any((element) => element.product.id == event.productId);
        if (result) {
          CartLine line = current.cart.lines
              .firstWhere((element) => element.product.id == event.productId);
          Cart cart = await OrderRepository.update(
              productId: event.productId, quantity: line.quantity + 1);
          emit(LoadedState(cart));
        } else {
          Cart cart = await OrderRepository.update(
              productId: event.productId, quantity: 1);
          emit(LoadedState(cart));
        }
      } else if (event is RemoveEvent && current is LoadedState) {
        bool result = current.cart.lines
            .any((element) => element.product.id == event.productId);
        if (result) {
          CartLine line = current.cart.lines
              .firstWhere((element) => element.product.id == event.productId);
          Cart cart = await OrderRepository.update(
              productId: event.productId, quantity: line.quantity - 1);
          emit(LoadedState(cart));
        } else {
          emit(current);
        }
      } else if (event is DeleteLineEvent && current is LoadedState) {
        var cart = await OrderRepository.update(
            productId: event.productId, quantity: 0);
        emit(LoadedState(cart));
      }
    } catch (e) {
      emit(ErrorState());
    }
  }
}
